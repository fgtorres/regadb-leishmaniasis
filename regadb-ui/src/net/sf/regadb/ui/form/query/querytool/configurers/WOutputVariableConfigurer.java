package net.sf.regadb.ui.form.query.querytool.configurers;

import com.pharmadm.custom.rega.queryeditor.ConfigurableWord;
import com.pharmadm.custom.rega.queryeditor.OutputVariable;
import com.pharmadm.custom.rega.queryeditor.OutputVariable.DescriptionDisplay;
import com.pharmadm.custom.rega.queryeditor.OutputVariable.RelationDisplay;
import com.pharmadm.custom.rega.queryeditor.OutputVariable.UniqueNameDisplay;
import com.pharmadm.custom.rega.queryeditor.wordconfiguration.OutputVariableConfigurer;

import eu.webtoolkit.jwt.WText;

public class WOutputVariableConfigurer extends WText implements OutputVariableConfigurer {

    private OutputVariable var;
    
    /** 
     * <p>
     * Creates a new instance of JOutputVariableConfigurer to show and configure
     * a particular OutputVariable through a given ConfigurationController
     * controller
     * </p>
     * <p>
     * @param var The OutputVariable that the JComponent will configure
     * @param controller The controller in charge of configuration
     * </p>
     */
    public WOutputVariableConfigurer(OutputVariable var) {
    	/**
    	 * for display as single output variable
    	 */
        super(var.getName(RelationDisplay.SHOW,
        		DescriptionDisplay.SHOW,
        		UniqueNameDisplay.SHOW_WHEN_ASSIGNED));
        this.setStyleClass("outputvariableconfigurer");
        this.var = var;
    }
    
    public ConfigurableWord getWord() {
        return var;
    }
    
    /** does nothing, output variables can not be configured */
    public void configureWord() {
    }

	/**
	 * for display in output variable dropdown
	 */
	public String toString() {
		return var.getName(RelationDisplay.SHOW, DescriptionDisplay.SHOW, UniqueNameDisplay.HIDE);
	}

	public void reAssign(Object o) {
		// does nothing. nothing to configure
	}

	public boolean isUseless() {
		return false;
	}
}
