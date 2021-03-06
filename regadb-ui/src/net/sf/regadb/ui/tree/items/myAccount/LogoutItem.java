package net.sf.regadb.ui.tree.items.myAccount;

import net.sf.regadb.ui.forms.login.LoginForm;
import net.sf.regadb.ui.framework.RegaDBMain;
import net.sf.regadb.ui.framework.tree.TreeMenuNode;
import net.sf.regadb.ui.framework.widgets.UIUtils;
import eu.webtoolkit.jwt.Signal1;
import eu.webtoolkit.jwt.StandardButton;
import eu.webtoolkit.jwt.WMessageBox;
import eu.webtoolkit.jwt.WTreeNode;

public class LogoutItem extends TreeMenuNode
{
    public LogoutItem(WTreeNode root)
    {
        super(tr("menu.myAccount.logout"), root, true);
    }
    
    @Override
    public void doAction()
    {
        final WMessageBox cmb = UIUtils.createYesNoMessageBox(LogoutItem.this, tr("menu.myAccount.logout.warning"));
        cmb.buttonClicked().addListener(LogoutItem.this, new Signal1.Listener<StandardButton>(){
			public void trigger(StandardButton sb) {
				cmb.remove();
				if(sb==StandardButton.Yes) {
                    RegaDBMain.getApp().getFormContainer().setForm(new LoginForm());
                    RegaDBMain.getApp().logout();
                    RegaDBMain.getApp().getWindow().newTree();
                    RegaDBMain.getApp().getTree().getRootTreeNode().refresh();
                    RegaDBMain.getApp().getTree().getTreeContent().accountNode.expand();
				}
			}
        });
        cmb.show();
    }

    @Override
    public boolean isDisabled()
    {
        return RegaDBMain.getApp().getLogin()==null;
    }
}
