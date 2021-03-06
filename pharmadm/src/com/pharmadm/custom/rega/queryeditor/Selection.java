/*
 * SelectionStatus.java
 *
 * Created on September 5, 2003, 10:03 AM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.queryeditor;


/**
 *
 * @author  kristof
 */
public interface Selection {
    
    public Object getObject();
    
    public Object getObjectSpec();
    
    public boolean isSelected();
    
    public void setSelected(boolean selected);
    
    public java.util.Collection<Selection> getSubSelections(); // of type Selection
    
    public SelectionList getController();
    
    public void setController(SelectionList controller);
    
    /**
     * return true when the selection matches the DB state
     * @return
     */
    public boolean isValid();
    
}
