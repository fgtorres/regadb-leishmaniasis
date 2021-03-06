/*
 * SimpleOutputSelectorPanel.java
 *
 * Created on September 5, 2003, 7:27 PM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.reporteditor.gui;

import com.pharmadm.custom.rega.reporteditor.*;
import com.pharmadm.custom.rega.reporteditor.wordconfiguration.JObjectListVariableSeeder;

/**
 *
 * @author  kristof
 */
public class ObjectListSeederPanel extends javax.swing.JPanel {
    
    private ObjectListVariable olvar;
    private JObjectListVariableSeeder seeder;
    private QueryOutputReportSeeder controller;
    
    /** Creates new form SimpleOutputSelectorPanel */
    public ObjectListSeederPanel(ObjectListVariable olvar, QueryOutputReportSeeder controller) {
        this.olvar = olvar;
        this.seeder = new JObjectListVariableSeeder(olvar, controller);
        this.controller = controller;
        initComponents();
        initMoreComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    private void initComponents() {//GEN-BEGIN:initComponents
        jLabel1 = new javax.swing.JLabel();

        jLabel1.setText(olvar.getUniqueName() + " <- ");
        add(jLabel1);

    }//GEN-END:initComponents
    
    private void initMoreComponents() {
        add(seeder);
    }
   
    public void apply() {
        seeder.configureWord();
    }
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
    
}
