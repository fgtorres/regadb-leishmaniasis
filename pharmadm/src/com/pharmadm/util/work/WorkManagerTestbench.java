/*
 * WorkManagerTestbench.java
 *
 * Created on June 10, 2005, 11:11 AM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.util.work;

/**
 * A GUI for manually testing WorkManager.
 *
 * @author  kdg
 */
public class WorkManagerTestbench extends javax.swing.JFrame {
    
    private WorkManager workMan;
    private Work latestWork;
    
    /** Creates new form WorkManagerTestbench */
    public WorkManagerTestbench() {
        initComponents();
        workMan = new WorkManager(infoPanel);
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        jPanel1 = new javax.swing.JPanel();
        newWorkButton = new javax.swing.JButton();
        longSleepWorkButton = new javax.swing.JButton();
        newAndWaitButton = new javax.swing.JButton();
        abortLatestButton = new javax.swing.JButton();
        replaceLatestButton = new javax.swing.JButton();
        replaceOrAddButton = new javax.swing.JButton();
        newNonAbortButton = new javax.swing.JButton();
        newNonPauseButton = new javax.swing.JButton();
        newNonAbortNonPauseButton = new javax.swing.JButton();
        threadPanel = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        infoPanel = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("WorkManager Testbench");
        jPanel1.setLayout(new java.awt.GridBagLayout());

        newWorkButton.setMnemonic('n');
        newWorkButton.setText("New Work");
        newWorkButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newWorkButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(newWorkButton, gridBagConstraints);

        longSleepWorkButton.setMnemonic('l');
        longSleepWorkButton.setText("New long sleep work");
        longSleepWorkButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                longSleepWorkButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(longSleepWorkButton, gridBagConstraints);

        newAndWaitButton.setMnemonic('w');
        newAndWaitButton.setText("New and wait");
        newAndWaitButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newAndWaitButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(newAndWaitButton, gridBagConstraints);

        abortLatestButton.setMnemonic('a');
        abortLatestButton.setText("Abort Latest");
        abortLatestButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                abortLatestButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(abortLatestButton, gridBagConstraints);

        replaceLatestButton.setMnemonic('r');
        replaceLatestButton.setText("Replace latest");
        replaceLatestButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                replaceLatestButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(replaceLatestButton, gridBagConstraints);

        replaceOrAddButton.setMnemonic('e');
        replaceOrAddButton.setText("Replace latest or add");
        replaceOrAddButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                replaceOrAddButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(replaceOrAddButton, gridBagConstraints);

        newNonAbortButton.setText("New non-abortable");
        newNonAbortButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newNonAbortButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(newNonAbortButton, gridBagConstraints);

        newNonPauseButton.setText("New non-pausable");
        newNonPauseButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newNonPauseButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(newNonPauseButton, gridBagConstraints);

        newNonAbortNonPauseButton.setText("New non-abortable non-pausable");
        newNonAbortNonPauseButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newNonAbortNonPauseButtonActionPerformed(evt);
            }
        });

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel1.add(newNonAbortNonPauseButton, gridBagConstraints);

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        threadPanel.setLayout(new java.awt.GridBagLayout());

        jLabel1.setText(" (C) PharmaDM");
        jLabel1.setBorder(new javax.swing.border.BevelBorder(javax.swing.border.BevelBorder.LOWERED));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.ipadx = 5;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 1.0;
        threadPanel.add(jLabel1, gridBagConstraints);

        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 1.0;
        threadPanel.add(infoPanel, gridBagConstraints);

        getContentPane().add(threadPanel, java.awt.BorderLayout.SOUTH);

        pack();
    }
    // </editor-fold>//GEN-END:initComponents

    private void newNonAbortNonPauseButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newNonAbortNonPauseButtonActionPerformed
        MyWork newWork = new MyWork();
        newWork.setAbortable(false);
        newWork.setPausable(false);
        latestWork = newWork;
        workMan.execute(latestWork);
    }//GEN-LAST:event_newNonAbortNonPauseButtonActionPerformed

    private void newNonPauseButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newNonPauseButtonActionPerformed
        MyWork newWork = new MyWork();
        newWork.setPausable(false);
        latestWork = newWork;
        workMan.execute(latestWork);
    }//GEN-LAST:event_newNonPauseButtonActionPerformed

    private void newNonAbortButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newNonAbortButtonActionPerformed
        MyWork newWork = new MyWork();
        newWork.setAbortable(false);
        latestWork = newWork;
        workMan.execute(latestWork);
    }//GEN-LAST:event_newNonAbortButtonActionPerformed
    
    private void longSleepWorkButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_longSleepWorkButtonActionPerformed
        latestWork = new LongSleepWork();
        workMan.execute(latestWork);
    }//GEN-LAST:event_longSleepWorkButtonActionPerformed
    
    private void replaceOrAddButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_replaceOrAddButtonActionPerformed
        Work replacement = new MyWork();
        workMan.abortAndReplace(latestWork, replacement, true);
        latestWork = replacement;
    }//GEN-LAST:event_replaceOrAddButtonActionPerformed
    
    private void newAndWaitButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newAndWaitButtonActionPerformed
        latestWork = new MyWork();
        workMan.executeAndWait(latestWork);
    }//GEN-LAST:event_newAndWaitButtonActionPerformed
    
    private void abortLatestButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_abortLatestButtonActionPerformed
        boolean aborted = workMan.abort(latestWork);
        System.out.println("Work aborted: " + aborted);
    }//GEN-LAST:event_abortLatestButtonActionPerformed
    
    private void replaceLatestButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_replaceLatestButtonActionPerformed
        Work replacement = new MyWork();
        boolean replaced = workMan.abortAndReplace(latestWork, replacement, false);
        System.out.println("Replacement scheduled: " + replaced);
        latestWork = replacement;
    }//GEN-LAST:event_replaceLatestButtonActionPerformed
    
    private void newWorkButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newWorkButtonActionPerformed
        latestWork = new MyWork();
        workMan.execute(latestWork);
    }//GEN-LAST:event_newWorkButtonActionPerformed
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new WorkManagerTestbench().setVisible(true);
            }
        });
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton abortLatestButton;
    private javax.swing.JPanel infoPanel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JButton longSleepWorkButton;
    private javax.swing.JButton newAndWaitButton;
    private javax.swing.JButton newNonAbortButton;
    private javax.swing.JButton newNonAbortNonPauseButton;
    private javax.swing.JButton newNonPauseButton;
    private javax.swing.JButton newWorkButton;
    private javax.swing.JButton replaceLatestButton;
    private javax.swing.JButton replaceOrAddButton;
    private javax.swing.JPanel threadPanel;
    // End of variables declaration//GEN-END:variables
    
    private class MyWork extends WorkAdapter {
        private int amount = 100;
        
        public MyWork() {
            setTotalAmount(amount);
        }
        
        public void execute() throws InterruptedException {
            for (int i = 0; i<amount && getContinuationArbiter().mayContinue(); i++) {
                Thread.sleep(50);
                increaseAmountDone();
            }
        }
    }
    
    private class LongSleepWork extends WorkAdapter {
        private int amount = 2;
        
        public LongSleepWork() {
            setTotalAmount(amount);
            setDescription("Two long sleeps");
        }
        
        public void execute() throws InterruptedException {
            for (int i = 0; i<amount && getContinuationArbiter().mayContinue(); i++) {
                Thread.sleep(3000);
                increaseAmountDone();
            }
        }
    }
}
