/*
 * JInputVariableConfigurer.java
 *
 * Created on September 1, 2003, 2:29 PM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.gui.configurers;

import com.pharmadm.custom.rega.queryeditor.*;
import com.pharmadm.custom.rega.queryeditor.wordconfiguration.InputVariableController;
import com.pharmadm.custom.rega.queryeditor.wordconfiguration.WordConfigurer;

/**
 *
 * @author  kristof
 */
public class JInputVariableConfigurer extends javax.swing.JComboBox implements WordConfigurer {
    
    private InputVariable var;
    private InputVariableController controller;
    
    /** 
     * <p>
     * Creates a new instance of JInputVariableConfigurer to show and configure
     * a particular InputVariable through a given InputVariableController
     * controller
     * </p>
     * <p>
     * @param var The InputVariable that the JComponent will configure
     * @param controller The controller in charge of configuration
     * </p>
     */
    public JInputVariableConfigurer(InputVariable input, InputVariableController controller) {
        super(controller.getCompatibleOutputVariables(input).toArray(new OutputVariable[0]));
        this.var = input;
        this.controller = controller;
    }
    
    public ConfigurableWord getWord() {
        return var;
    }    
    
    public void configureWord() {
        this.controller.assignOutputVariable(var, (OutputVariable)getSelectedItem());
    }    

	public void reAssign(Object o) {
		JInputVariableConfigurer confy = (JInputVariableConfigurer) o;
		confy.controller = this.controller;
		confy.var = this.var;
		this.setSelectedIndex(confy.getSelectedIndex());
	}

	public boolean isUseless() {
		return false;
	}
}