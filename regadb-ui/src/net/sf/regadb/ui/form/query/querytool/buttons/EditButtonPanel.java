package net.sf.regadb.ui.form.query.querytool.buttons;

import java.util.ArrayList;
import java.util.List;

import net.sf.regadb.ui.form.query.querytool.tree.QueryEditorTreeContainer;
import net.sf.regadb.ui.form.query.querytool.tree.QueryTreeNode;
import net.sf.regadb.ui.form.query.querytool.widgets.WButtonPanel;

import com.pharmadm.custom.rega.queryeditor.AndClause;
import com.pharmadm.custom.rega.queryeditor.InclusiveOrClause;
import com.pharmadm.custom.rega.queryeditor.NotClause;
import com.pharmadm.custom.rega.queryeditor.UniqueNameContext.AssignMode;
import com.pharmadm.custom.rega.queryeditor.WhereClause;

import eu.webtoolkit.jwt.Signal1;
import eu.webtoolkit.jwt.WMouseEvent;
import eu.webtoolkit.jwt.WPushButton;

public class EditButtonPanel extends WButtonPanel {
	private QueryEditorTreeContainer owner;
	private List<QueryTreeNode> selection;
	private List<WhereClause> cursorClauses;
	
	private boolean pasted;
	
	private WPushButton cutButton_;
	private WPushButton copyButton_;
	private WPushButton pasteButton_;
	private WPushButton deleteButton_;
	private WPushButton unwrapButton_;
	private WPushButton wrapAndButton_;
	private WPushButton wrapOrButton_;
	private WPushButton wrapNotButton_;
	
	
	public EditButtonPanel(QueryEditorTreeContainer owner) {
		super(Style.Flat);
		this.owner = owner;
		cursorClauses = new ArrayList<WhereClause>();
		selection = new ArrayList<QueryTreeNode>();
		init();
	}
	
	private void init() {
		cutButton_ = new WPushButton(tr("form.query.querytool.pushbutton.cut"));
		copyButton_ = new WPushButton(tr("form.query.querytool.pushbutton.copy"));
		pasteButton_ = new WPushButton(tr("form.query.querytool.pushbutton.paste"));
		deleteButton_ = new WPushButton(tr("form.query.querytool.pushbutton.delete"));
		unwrapButton_ = new WPushButton(tr("form.query.querytool.pushbutton.unwrap"));
		wrapAndButton_ = new WPushButton(tr("form.query.querytool.pushbutton.wrapand"));
		wrapOrButton_ = new WPushButton(tr("form.query.querytool.pushbutton.wrapor"));
		wrapNotButton_ = new WPushButton(tr("form.query.querytool.pushbutton.wrapnot"));
		
		copyButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				List<QueryTreeNode> selection = getSelection();
				cursorClauses = new ArrayList<WhereClause>();
				for (QueryTreeNode node : selection) {
					cursorClauses.add(node.getClause());
				}
				update();
				pasted = true;
			}
		});
		
		pasteButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				List<QueryTreeNode> selection = getSelection();
				QueryTreeNode pasteNode = (selection.isEmpty()?owner.getRootNode() :selection.get(0));
				if (pasteNode.getClause().isAtomic()) {
					pasteNode = pasteNode.getParentNode();
				}
				paste(pasteNode);
			}
		});
		
		deleteButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				List<QueryTreeNode> selection = getSelection();
				owner.setValidation(false);
				for (QueryTreeNode node : selection) {
					node.getParentNode().removeNode(node);
				}
				owner.setValidation(true);
			}
		});
		
		cutButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				List<QueryTreeNode> selection = getSelection();
				owner.setValidation(false);
				cursorClauses = new ArrayList<WhereClause>();
				for (QueryTreeNode node : selection) {
					cursorClauses.add(node.getClause());
				}
				owner.setValidation(true);
				pasted = false;
			}
		});
		
		unwrapButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				List<QueryTreeNode> selection = getSelection();
				owner.setValidation(false);
				
				List<QueryTreeNode> newSelection = new ArrayList<QueryTreeNode>();
				QueryTreeNode parent = selection.get(0).getParentNode();
				QueryTreeNode gp = parent.getParentNode();
				for (QueryTreeNode node : selection) {
					parent.removeNode(node);
					newSelection.add(gp.addNode(node.getClause(), AssignMode.none));
				}
				
				for (QueryTreeNode node : newSelection) {
					node.setSelected(true);
				}
				owner.setValidation(true);
			}
		});
		
		wrapAndButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				wrapIn(new AndClause());
			}
		});

		wrapOrButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				wrapIn(new InclusiveOrClause());
			}
		});	
		
		wrapNotButton_.clicked().addListener(this, new Signal1.Listener<WMouseEvent>() {
			public void trigger(WMouseEvent a) {
				wrapIn(new NotClause());
			}
		});		
		
		addButton(cutButton_);
		addButton(copyButton_);
		addButton(pasteButton_);
		addSeparator();
		addButton(deleteButton_);
		
		addSeparator();
		addButton(unwrapButton_);
		addSeparator();
		addButton(wrapAndButton_);
		addButton(wrapOrButton_);
		addButton(wrapNotButton_);
		
	}
	
	private void paste(QueryTreeNode targetNode) {
		owner.getQueryEditor().getQuery().getUniqueNameContext().startTransaction();
        try {
            for (WhereClause clause : cursorClauses) {
                if (targetNode.getClause().acceptsAdditionalChild()) {
                		WhereClause copy = (WhereClause) clause.clone();
						targetNode.addNode(copy, pasted ? AssignMode.all: AssignMode.none);
                }
            }
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		pasted = true;
		owner.getQueryEditor().getQuery().getUniqueNameContext().endTransaction();		
	}
	
	private void wrapIn(WhereClause wrapper) {
		List<QueryTreeNode> selection = getSelection();
		owner.setValidation(false);
		List<QueryTreeNode> newSelection = new ArrayList<QueryTreeNode>();
		QueryTreeNode parent = selection.get(0).getParentNode();

		QueryTreeNode firstNode = selection.remove(0);
		WhereClause firstClause = firstNode.getClause();
		QueryTreeNode wrapperNode = firstNode.replaceNode(wrapper);
		newSelection.add(wrapperNode.addNode(firstClause, AssignMode.none));
		
		while (selection.size() > 0 && wrapper.acceptsAdditionalChild()) {
			QueryTreeNode node = selection.remove(0);
			WhereClause clause = node.getClause();
			parent.removeNode(node);
			newSelection.add(wrapperNode.addNode(clause, AssignMode.none));
		}
		
		for (QueryTreeNode node : newSelection) {
			node.setSelected(true);
		}
		wrapperNode.setSelected(false);
		owner.setValidation(true);
	}
	
	public void setEnabled(boolean enabled) {
		super.setEnabled(enabled);
		checkButtons(enabled);
	}
	
	private void checkButtons(boolean enabled) {
        boolean haveSameParent = haveSameParent(selection);
        boolean containsRoot = containsRootClause(selection);
        
        wrapAndButton_.setEnabled(haveSameParent && enabled);
        wrapOrButton_.setEnabled(haveSameParent && enabled);
        wrapNotButton_.setEnabled(haveSameParent && enabled && selection.size() == 1);

        unwrapButton_.setEnabled(haveSameParent && firstHasGrandParent() && enabled);
        
        copyButton_.setEnabled(haveSameParent && enabled);
        cutButton_.setEnabled(haveSameParent && enabled);
        pasteButton_.setEnabled(cursorClauses.size() > 0 && enabled);
        deleteButton_.setEnabled(!containsRoot && selection.size() > 0 && enabled);		
	}

	public void update() {
		selection = owner.getSelection();
		checkButtons(isEnabled());
	}
	
	private boolean firstHasGrandParent() {
		return selection.size() > 0 
		&& selection.get(0).getParentNode() != null
		&& selection.get(0).getParentNode().getParentNode() != null;
	}
	
    private boolean haveSameParent(List<QueryTreeNode> selection) {
    	boolean same = selection.size() > 0;
    	
    	if (selection.size() > 0) {
    		QueryTreeNode parentNode = selection.get(0).getParentNode();
	    	for (QueryTreeNode node : selection) {
	    		if (node.getParentNode() == null || !node.getParentNode().equals(parentNode)) {
	    			same = false;
	    		}
	    	}
    	}

    	return same;
    }
    
    private boolean containsRootClause(List<QueryTreeNode> selection) {
    	boolean root = false;
    	
    	if (selection.size() > 0) {
	    	for (QueryTreeNode node : selection) {
	    		WhereClause clause = (WhereClause) node.getClause();
	    		if (clause.getParent() == null) {
	    			root = true;
	    		}
	    	}
    	}
    	return root;
    }
    
    /**
     * gets a copy of the currently active selection
     * edit operations should always work on a copy
     * of the selection as the actual selection is subject
     * to change
     */
    private List<QueryTreeNode> getSelection() {
    	List<QueryTreeNode> result = new ArrayList<QueryTreeNode>();
    	result.addAll(selection);
    	return result;
    }

}
