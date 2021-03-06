/*
 * UniqueNameContext.java
 *
 * Created on August 27, 2003, 4:43 PM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.queryeditor;

import java.io.Serializable;
import java.util.*;
import com.pharmadm.custom.rega.reporteditor.*;

/**
 * A class that knows how to create unique names for given formal names.
 *
 * <p>
 * This class supports xml-encoding.
 * The following new properties are encoded :
 *  formalNameToNumberMap
 * </p>
 * @author  kdg
 */
public class UniqueNameContext implements Serializable {
    
	public enum AssignMode {
		none,
		output,
		all
	}
	
    private Map<String, Long> formalNameToNumberMap;
    private Map<String, String> transactionNameMap;
    private Map<String, OutputVariable> transactionVarMap;
    
    public Map<String, Long> getFormalNameToNumberMap() {
        return formalNameToNumberMap;
    }
    public void setFormalNameToNumberMap(Map<String, Long> formalNameToNumberMap) {
        this.formalNameToNumberMap = formalNameToNumberMap;
    }
    
    /** Creates a new instance of UniqueNameContext */
    public UniqueNameContext() {
    }
    
    public void startTransaction() {
    	transactionNameMap = new HashMap<String, String>();
    	transactionVarMap = new HashMap<String, OutputVariable>();
    }

    public void endTransaction() {
    	transactionNameMap = null;
    	transactionVarMap = null;
    }
    
    public void assignUniqueNamesToAll(WhereClause whereClause) {
        assignUniqueNamesToOutputs(whereClause);
        assignUniqueNamesToInputs(whereClause);
    }
    
    public void assignUniqueNames(WhereClause clause, AssignMode mode) {
    	if (mode == AssignMode.all) {
    		assignUniqueNamesToAll(clause);
    	}
    	else if (mode == AssignMode.output) {
    		assignUniqueNamesToOutputs(clause);
    	}
    }
    
    public void assignUniqueNamesToOutputs(WhereClause whereClause) {
        Iterator iterAtomic = new AtomicWhereClauseIterator(whereClause);
        while (iterAtomic.hasNext()) {
            AtomicWhereClause anAtomicWC = (AtomicWhereClause)iterAtomic.next();
            Iterator<OutputVariable> outputs = anAtomicWC.getExportedOutputVariables().iterator();
            while (outputs.hasNext()) {
            	assignUniqueNameToOutputVariable(outputs.next());
            }
        }
    }
    
    public void assignUniqueNamesToInputs(WhereClause whereClause) {
        Iterator iterAtomic = new AtomicWhereClauseIterator(whereClause);
        while (iterAtomic.hasNext()) {
            AtomicWhereClause anAtomicWC = (AtomicWhereClause)iterAtomic.next();
            Iterator<InputVariable> inputs = anAtomicWC.getInputVariables().iterator();
            while (inputs.hasNext()) {
            	assignUniqueNameToInputVariable(inputs.next());
            }
        }
    }
    
    private void assignUniqueNameToInputVariable(InputVariable anInputVar) {
    	
    	if (transactionNameMap != null) {
    		if (transactionNameMap.containsKey(anInputVar.getOutputVariable().getUniqueName())) {
    			OutputVariable ovar = transactionVarMap.get(anInputVar.getOutputVariable().getUniqueName());
    			anInputVar.setOutputVariable(ovar);
    		}
    	}
    	else {
    		anInputVar.getOutputVariable().setUniqueName(createUniqueName(anInputVar.getOutputVariable().getFormalName()));
    	}
    }
    
    private void assignUniqueNameToOutputVariable(OutputVariable anOutputVar) {
    	if (transactionNameMap != null) {
    		if (transactionNameMap.containsKey(anOutputVar.getUniqueName())) {
    			anOutputVar.setUniqueName(transactionNameMap.get(anOutputVar.getUniqueName()));
    		}
    		else {
    	    	String uniqueName = createUniqueName(anOutputVar.getFormalName());
        		transactionNameMap.put(anOutputVar.getUniqueName(), uniqueName);
        		transactionVarMap.put(anOutputVar.getUniqueName(), anOutputVar);
    	        anOutputVar.setUniqueName(uniqueName);
    		}
    	}
    	else {
    		anOutputVar.setUniqueName(createUniqueName(anOutputVar.getFormalName()));
    	}
    }
    
    public void assignUniqueNamesToAll(ReportFormat reportFormat) {
        assignUniqueNamesToOutputs(reportFormat);
        assignUniqueNamesToInputs(reportFormat);
    }
    
    public void assignUniqueNamesToOutputs(ReportFormat reportFormat) {
        Iterator iter = reportFormat.getDataGroups().iterator();
        while (iter.hasNext()) {
            DataGroup aDataGroup = (DataGroup)iter.next();
            assignUniqueNamesToOutputs(aDataGroup);
        }
    }
    
    public void assignUniqueNamesToInputs(ReportFormat reportFormat) {
        Iterator iter = reportFormat.getDataGroups().iterator();
        while (iter.hasNext()) {
            DataGroup aDataGroup = (DataGroup)iter.next();
            assignUniqueNamesToInputs(aDataGroup);
        }
    }
    
    public void assignUniqueNamesToAll(DataGroup dataGroup) {
        assignUniqueNamesToOutputs(dataGroup);
        assignUniqueNamesToInputs(dataGroup);
    }
    
    public void assignUniqueNamesToOutputs(DataGroup dataGroup) {
        Iterator outputs = dataGroup.getDataOutputVariables().iterator();
        while (outputs.hasNext()) {
            DataOutputVariable anOutputVar = (DataOutputVariable)outputs.next();
            anOutputVar.setUniqueName(createUniqueName(anOutputVar.getFormalName()));
        }
    }
    
    public void assignUniqueNamesToInputs(DataGroup dataGroup) {
        Iterator inputs = dataGroup.getDataInputVariables().iterator();
        while (inputs.hasNext()) {
            DataOutputVariable anOutputVar = ((DataInputVariable)inputs.next()).getOutputVariable();
            anOutputVar.setUniqueName(createUniqueName(anOutputVar.getFormalName()));
        }        
    }
    
    /**
     * <p>
     * Creates a new query-wide unique name for a given formal name.
     * </p>
     * <p>
     *
     * @return the new unique name
     * </p>
     * <p>
     * @param formalName the descriptive formal name on which to build the
     * unique name
     * </p>
     */
    public String createUniqueName(String formalName) {
        if (formalNameToNumberMap == null) {
            formalNameToNumberMap = new HashMap<String, Long>();
        }
        Long nextNumberLong = (Long)formalNameToNumberMap.get(formalName);
        long nextNumber;
        if (nextNumberLong == null) {
            nextNumber = 1;
        } else {
            nextNumber = nextNumberLong.longValue();
        }
        formalNameToNumberMap.put(formalName, new Long(nextNumber + 1));
        return formalName + nextNumber;
    }
}
