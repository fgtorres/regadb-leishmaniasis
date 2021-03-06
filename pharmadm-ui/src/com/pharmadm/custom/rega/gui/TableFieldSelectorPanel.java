/*
 * TableFieldSelectorPanel.java
 *
 * Created on September 4, 2003, 12:42 PM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.gui;

import java.awt.Point;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;

import com.pharmadm.custom.rega.queryeditor.Field;
import com.pharmadm.custom.rega.queryeditor.FieldSelection;
import com.pharmadm.custom.rega.queryeditor.OutputVariable;
import com.pharmadm.custom.rega.queryeditor.Selection;
import com.pharmadm.custom.rega.queryeditor.SelectionStatusList;
import com.pharmadm.custom.rega.queryeditor.TableSelection;
import com.pharmadm.custom.rega.queryeditor.catalog.DbObject;

/**
 *
 * @author  kristof
 */
public class TableFieldSelectorPanel extends javax.swing.JPanel {
    
    /** Creates new form TableFieldSelectorPanel */
    public TableFieldSelectorPanel(TableSelection tableSelection) {
        this.tableSelection = tableSelection;
        initComponents();
        initTableCheckBox();
        initTableComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    private void initComponents() {//GEN-BEGIN:initComponents
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();

        setLayout(new java.awt.BorderLayout());

        jPanel1.setLayout(new java.awt.BorderLayout());

        jPanel1.setBorder(new javax.swing.border.BevelBorder(javax.swing.border.BevelBorder.LOWERED));
        jPanel1.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }//GEN-END:initComponents
    
    private void subCheckBoxActionPerformed(java.awt.event.ActionEvent evt) {
    	LargeToolTipCheckBox checkBox = ((LargeToolTipCheckBox)evt.getSource());
        DbObject obj = checkBox.getObject();
        ((SelectionStatusList)tableSelection.getController()).setSelected((OutputVariable)tableSelection.getObject(), obj.getField(), checkBox.isSelected());
    }
    
    private void initTableCheckBox() {
        tableCheckBox = new LargeToolTipCheckBox(tableSelection.getDbObject(), tableSelection.getVariableName(), tableSelection.isSelected());
        tableCheckBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tableCheckBoxActionPerformed(evt);
            }
        });
        add(tableCheckBox, java.awt.BorderLayout.WEST);
    }
    
    private void tableCheckBoxActionPerformed(java.awt.event.ActionEvent evt) {
        ((SelectionStatusList)tableSelection.getController()).setSelected((OutputVariable)tableSelection.getObject(), tableCheckBox.isSelected());
    }
    
    private void initTableComponents() {
        ScrollableFieldPanel fieldsPanel = new ScrollableFieldPanel();
        fieldsPanel.setLayout(new javax.swing.BoxLayout(fieldsPanel, javax.swing.BoxLayout.Y_AXIS));
        jScrollPane1.setViewportView(fieldsPanel);
        
        Iterator<Selection> fields = tableSelection.getSubSelections().iterator();
        double preferredHeight = 0;
        
        while (fields.hasNext()) {
            Selection fieldSelection = (FieldSelection)fields.next();
            Field field = (Field)fieldSelection.getObject();
            boolean selected = fieldSelection.isSelected();
            JCheckBox checkBox = new LargeToolTipCheckBox(tableSelection.getDbObject(), field.getDescription(), selected);
            checkBox.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    subCheckBoxActionPerformed(evt);
                }
            });
            fieldsPanel.add(checkBox);
            preferredHeight = preferredHeight+ checkBox.getPreferredSize().getHeight();
        }
        
        fieldsPanel.setMaxHeight(preferredHeight);
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
    private TableSelection tableSelection;
    private LargeToolTipCheckBox tableCheckBox;
    
    /**
     * Improves scroll wheel behaviour of the fields panel.
     */
    private static class ScrollableFieldPanel extends JPanel implements Scrollable {
        private java.awt.Dimension preferredSize = new java.awt.Dimension(100, 200);
        
        public void setMaxHeight(double totalHeight) {
            this.preferredSize = new java.awt.Dimension((int)preferredSize.getWidth(), java.lang.Math.min((int)java.lang.Math.ceil(totalHeight),200));
        }
        
        public java.awt.Dimension getPreferredScrollableViewportSize() {
            return this.preferredSize;
        }
        
        public int getScrollableBlockIncrement(java.awt.Rectangle visibleRect, int orientation, int direction) {
            return getScrollableUnitIncrement(visibleRect, orientation, direction) * 3;
        }
        
        public boolean getScrollableTracksViewportHeight() {
            return false;
        }
        
        public boolean getScrollableTracksViewportWidth() {
            return true;
        }
        
        public int getScrollableUnitIncrement(java.awt.Rectangle visibleRect, int orientation, int direction) {
            java.awt.Component firstComp = getComponent(0);
            if (firstComp != null) {
                return firstComp.getHeight();
            } else {
                return 10;
            }
        }
    }
    
    /**
     * A checkbox that can show elaborate documentation about itself.
     * To allow access to the documentation, both a special tooltip and a popupmenu are used.
     */
    private static class LargeToolTipCheckBox extends JCheckBox {
        private final DbObject object;
        public LargeToolTipCheckBox(DbObject obj, String text, boolean selected) {
            super(text, selected);
            this.object = obj;
            setToolTipText(getTooltipText());
            addMouseListener(new MenuPopupMouseListener());
        }
        
        public DbObject getObject() {
        	return object;
        }
        
        private String getTooltipText() {
        	String tooltip = null;
        	if (object.isTable()) {
        		tooltip = object.getTable().getComment();
        	}
        	else if (object.isField()) {
        		tooltip = object.getField().getComment();
        	}
            if (tooltip == null) {
            	tooltip = CommentToolTip.NO_COMMENT_AVAILABLE;
            }
            return tooltip;
        }
        
        public JToolTip createToolTip() {
            CommentToolTip ctt = new CommentToolTip(object, getTooltipText());
            return ctt;
        }
        
        private void showPopupMenu(Point p) {
            JPopupMenu popupMenu = new JPopupMenu();
            Point locOnScreen = this.getLocationOnScreen();
            locOnScreen.translate(p.x, p.y);
            popupMenu.add(new ShowPopupAction(locOnScreen));
            int x = p.x;
            int y = p.y;
            popupMenu.show(LargeToolTipCheckBox.this, x, y);
        }
        
        private class MenuPopupMouseListener extends MouseAdapter {
            public void mousePressed(MouseEvent e) {
                if (e.isPopupTrigger()) {
                    showPopupMenu(e.getPoint());
                }
            }
            
            public void mouseReleased(MouseEvent e) {
                if (e.isPopupTrigger()) {
                    showPopupMenu(e.getPoint());
                }
            }
        }
        
        private class ShowPopupAction extends AbstractAction {
            
            private final Point location;
            
            public ShowPopupAction(Point location) {
                super("Show definition\u2026");
                this.location = location;
            }
            
            public void actionPerformed(ActionEvent e) {
                CommentToolTip.showWindowedComment(object, getTooltipText(), location);
            }
        }
    }
}
