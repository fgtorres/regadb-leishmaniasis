package net.sf.regadb.workflow.ui;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.ArrayList;

import javax.swing.JFileChooser;
import javax.swing.JInternalFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileFilter;

import net.sf.regadb.workflow.analysis.execution.Execute;
import net.sf.regadb.workflow.analysis.io.ExportWorkflow;
import net.sf.regadb.workflow.jgraph.WFAnalysisBox;
import net.sf.regadb.workflow.jgraph.WorkFlow;

import org.jgraph.graph.CellView;

import static net.sf.regadb.swing.i18n.I18n.tr;

public class MenuBar extends JMenuBar
{
    private MainFrame mainFrame_;
    
    public MenuBar(MainFrame mainFrame)
    {
        super();
        
        mainFrame_ = mainFrame;
        
        JMenu fileMenu = this.add(new JMenu(tr("menuBar.fileMenu.main")));
        
        JMenuItem newItem = fileMenu.add(new JMenuItem(tr("menuBar.fileMenu.newItem")));
        newItem.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e) {
                mainFrame_.createNewWorkflow(mainFrame_);
            }
        });
        JMenuItem openItem = fileMenu.add(new JMenuItem(tr("menuBar.fileMenu.openItem")));
        openItem.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e) {
                JFileChooser fc = new JFileChooser();
                int returnVal = fc.showDialog(mainFrame_, tr("fileChooser.openButton"));
                if(returnVal==JFileChooser.APPROVE_OPTION) {
                    
                }
            }
        });
        
        JMenuItem saveItem = fileMenu.add(new JMenuItem(tr("menuBar.fileMenu.saveItem")));
        saveItem.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e) {
                JInternalFrame internalFrame = mainFrame_.getDesktop().getSelectedFrame();
                if(internalFrame!=null) {
                    Component c = internalFrame.getContentPane().getComponent(0);
                    if(c instanceof WorkFlow) {
                        JFileChooser fc = new JFileChooser();
                        int returnVal = fc.showDialog(mainFrame_, tr("fileChooser.saveButton"));
                        if(returnVal==JFileChooser.APPROVE_OPTION) {
                            System.err.println(fc.getSelectedFile().getAbsolutePath());
                            CellView[] cv = ((WorkFlow)c).getGraphLayoutCache().getAllViews();
                            Object [] cells = ((WorkFlow)c).getGraphLayoutCache().getCells(cv);
                            ArrayList<WFAnalysisBox> analyses = new ArrayList<WFAnalysisBox>();
                            for(Object o : cells) {
                                if(o instanceof WFAnalysisBox) {
                                    analyses.add(((WFAnalysisBox)o));
                                }
                            }
                            ExportWorkflow export = new ExportWorkflow();
                            export.writeXMLFile(analyses, fc.getSelectedFile());
                        }
                    }
                }
            }
        });
        
        fileMenu.addSeparator();
        
        JMenu runMenu = this.add(new JMenu(tr("menuBar.fileMenu.run")));
        JMenuItem execItem = runMenu.add(new JMenuItem(tr("menuBar.fileMenu.run.execute")));
        execItem.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e) {
                JInternalFrame internalFrame = mainFrame_.getDesktop().getSelectedFrame();
                if(internalFrame!=null) {
                    Component c = internalFrame.getContentPane().getComponent(0);
                    if(c instanceof WorkFlow) {
                        Execute exec = new Execute();
                        if(!exec.edgeControl((WorkFlow)c)) {
                            JOptionPane.showMessageDialog(null, tr("workflow.general.notAllPortsAreConnected"), tr("workflow.general.warningMessage"), JOptionPane.WARNING_MESSAGE);
                            return;
                        }
                        JFileChooser fc = new JFileChooser();
                        fc.setDialogTitle(tr("fileChooser.chooseAnEmptyDir"));
                        fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
                        fc.setFileFilter(new FileFilter() {
                            public boolean accept(File pathname) {
                                if(pathname.isDirectory() && pathname.list().length==0)
                                    return true;
                                else
                                    return false;
                            }

                            @Override
                            public String getDescription() {
                                return "Empty directories";
                            }
                        });
                        int returnVal = fc.showDialog(mainFrame_, tr("fileChooser.chooseEmptyDir"));
                        if(returnVal==JFileChooser.APPROVE_OPTION) {
                            exec.exec((WorkFlow)c, fc.getSelectedFile());
                        }
                        
                    }
                }
                
            }
        });
    }
}
