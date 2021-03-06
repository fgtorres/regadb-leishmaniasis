
/** Java class "OrderedWordList.java" generated from Poseidon for UML.
 *  Poseidon for UML is developed by <A HREF="http://www.gentleware.com">Gentleware</A>.
 *  Generated with <A HREF="http://jakarta.apache.org/velocity/">velocity</A> template engine.
 */
/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.queryeditor;

import java.io.Serializable;

import com.pharmadm.custom.rega.queryeditor.constant.Constant;
import com.pharmadm.custom.rega.queryeditor.port.QueryVisitor;

/**
 * <p>
 * An OrderedAWCWordList can properly concatenate the String representation of
 * its Words into a clause in a particular format.
 * </p>
 * <p>
 * This class supports xml-encoding. No new properties are encoded.
 * </p>
 * 
 */
public class OrderedAWCWordList extends OrderedConfigurableWordList implements Serializable {
	   
    /** For xml-encoding purposes only */
    public OrderedAWCWordList() {
    }
    
    public OrderedAWCWordList(AtomicWhereClause owner) {
        super(owner);
    }
    
    public void addWord(AWCWord word) {
    	if (word instanceof FixedString) {
    		addFixedString((FixedString) word);
    	}
    	else if (word instanceof Constant) {
    		addConstant((Constant) word);
    	}
    	else if (word instanceof InputVariable) {
    		addInputVariable((InputVariable) word);
    	}
    	else if (word instanceof OutputVariable) {
    		addOutputVariable((OutputVariable) word);
    	}
    	else if (word instanceof FromVariable) {
    		addFromVariable((FromVariable) word);
    	}
    }
     
    public void addConstant(Constant constant) {
        getWords().add(constant);
        if (hasOwner()) {
            ((AtomicWhereClause)getOwner()).addConstant(constant);
        }
    }
    public void addFixedString(FixedString fString) {
        getWords().add(fString);
    }
    public void addOutputVariable(OutputVariable outputVar) {
        getWords().add(outputVar);
        if (hasOwner()) {
            ((AtomicWhereClause)getOwner()).addOutputVariable(outputVar);
        }
    }
    public void addInputVariable(InputVariable inputVar) {
        getWords().add(inputVar);
        if (hasOwner()) {
            ((AtomicWhereClause)getOwner()).addInputVariable(inputVar);
        }
    }
    public void addFromVariable(FromVariable fromVar) {
        getWords().add(fromVar);
        if (hasOwner()) {
            ((AtomicWhereClause)getOwner()).addFromVariable(fromVar);
        }
    }
    
    // would require expensive updateing of the sets of AtomicWhereClause
    //public void removeAWCWord(AWCWord aWCWord) {
    //    aWCWords.remove(aWCWord);
    //}
    
    //public void addAll(OrderedWordList owl) {
    //    aWCWords.addAll(owl.aWCWords);
    //    getOwner().addWords(owl);
    //}
    
    
    ///////////////////////////////////////
    // operations
    
    
    public String acceptWhereClause(QueryVisitor visitor) {
    	return visitor.visitWhereClauseOrderedAWCWordList(this);
    }
}
