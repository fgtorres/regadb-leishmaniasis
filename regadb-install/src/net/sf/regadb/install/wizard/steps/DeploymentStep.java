package net.sf.regadb.install.wizard.steps;

import java.awt.GridBagLayout;
import java.io.File;
import java.util.Map;

import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.filechooser.FileFilter;

import net.sf.regadb.install.wizard.FilePicker;
import net.sf.regadb.install.wizard.RegaDBWizardPage;

import org.netbeans.spi.wizard.Wizard;
import org.netbeans.spi.wizard.WizardPanelNavResult;

public class DeploymentStep extends RegaDBWizardPage {
	private static final long serialVersionUID = -1831736308327506143L;
	private JCheckBox deploy_DoWant;
	private FilePicker deployPick;
	private FilePicker warPick;
	
	public DeploymentStep() {
		super("deploy", tr("stepDeployment"), tr("deploy_Description"));
		getContainer().setLayout(new GridBagLayout());
		
		deploy_DoWant = new JCheckBox(tr("deploy_DoWant"));
		deploy_DoWant.setName("deployDoWant");
		deploy_DoWant.setSelected(true);
		getContainer().add(deploy_DoWant, getGridBag(0, lineNr++));
		
		deployPick = new FilePicker("deploydir");
		deployPick.setDirectoryOnly(true);
		getContainer().add(deployPick, getGridBag(0, lineNr++));
		
		getContainer().add(new JLabel(tr("war_Description")), getGridBag(0, lineNr++));
		warPick = new FilePicker("warfile");
		warPick.setFileFilter(new FileFilter(){

			@Override
			public boolean accept(File arg0) {
				return arg0.getName().toLowerCase().endsWith(".war");
			}

			@Override
			public String getDescription() {
				return "WAR file (*.war)";
			}
		});
		getContainer().add(warPick, getGridBag(0, lineNr++));
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public WizardPanelNavResult allowFinish(String stepName, Map settings, Wizard wizard) {
		File ff = new File( deployPick.getTextField().getText() );
		if ( deploy_DoWant.isSelected() ) {
			if ( !ff.exists() ) {
				setProblem(tr("deploy_NotFound"));
				return WizardPanelNavResult.REMAIN_ON_PAGE;
			} else {
				for( File f : ff.listFiles() ) {
					if ( f.getName().equals("webapps") ) {
						if ( !f.canWrite() ) {
							setProblem(tr("directory_Unwritable").replaceAll("\\{DIR\\}", f.getAbsolutePath()));
							return WizardPanelNavResult.REMAIN_ON_PAGE;
						} else {
							return WizardPanelNavResult.PROCEED;
						}
					}
				}
				setProblem(tr("deploy_NoTomcat"));
				return WizardPanelNavResult.REMAIN_ON_PAGE;
			}
		}
		return WizardPanelNavResult.PROCEED;
	}
	
	public static String getDescription() {
		return tr("stepDeployment");
	}
}
