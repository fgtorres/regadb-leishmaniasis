/*
 * SubstringConstant.java
 *
 * Created on December 1, 2003, 1:41 PM
 */

/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.queryeditor.constant;

import java.io.Serializable;

import com.pharmadm.custom.rega.queryeditor.port.QueryVisitor;

/**
 * A StringConstant for use in LIKE-statements.
 * It appends and prepends a percentage sign o the user-selected string.
 *
 * @author  kdg
 */
public class StartstringConstant extends StringConstant implements Serializable{
    public String acceptWhereClause(QueryVisitor visitor) {
    	return visitor.visitWhereClauseStartstringConstant(this);
    }
}
