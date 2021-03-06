package net.sf.regadb.ui.framework.tree;

import net.sf.regadb.ui.framework.RegaDBMain;

public class RootMenuNode extends TreeMenuNode {
	
	public RootMenuNode() {
		super(tr("menu.root.rootItem"), null, true);
	}
	
	@Override
	public boolean isDisabled() {
		return (RegaDBMain.getApp().getLogin() == null);
	}
	
	public void doAction(){
		
	}

	@Override
	public boolean matchesInternalPath(String[] path, int depth) {
		return true;
	}

	@Override
	public boolean canLeaveNode() {
		return true;
	}
}
