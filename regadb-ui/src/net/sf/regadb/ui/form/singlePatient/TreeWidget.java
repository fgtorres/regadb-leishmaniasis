package net.sf.regadb.ui.form.singlePatient;

import java.awt.Color;
import java.awt.Graphics;

import eu.webtoolkit.jwt.WLength;
import eu.webtoolkit.jwt.WPaintDevice;
import eu.webtoolkit.jwt.WPaintedWidget;
import eu.webtoolkit.jwt.WPainter;
import eu.webtoolkit.jwt.utils.WebGraphics2D;
import figtree.treeviewer.TreePane;
import figtree.treeviewer.TreePaneSelector;
import figtree.treeviewer.treelayouts.RectilinearTreeLayout;

public class TreeWidget extends WPaintedWidget {

	private TreePane treePane;
	private WebGraphics2D graphics = new WebGraphics2D(new WPainter());

	public TreeWidget() {
		treePane = new TreePane() {
			private static final long serialVersionUID = 1L; 

			@Override
			public void repaint() {
				TreeWidget.this.update();
			}

			@Override
			public Graphics getGraphics() {
				return graphics;
			}
		};

		treePane.setTreeLayout(new RectilinearTreeLayout());
		treePane.setSelectionColor(new Color(90, 108, 128));
		final TreePaneSelector selector = new TreePaneSelector(treePane);
	}

	@Override
	public void resize(WLength width, WLength height) {
		super.resize(width, height);
		treePane.setSize((int)width.toPixels(), (int)height.toPixels());
	}
	

	@Override
	protected void layoutSizeChanged(int width, int height) {
		super.layoutSizeChanged(width, height);
		treePane.setSize(width, height);
	}	
	
	@Override
	protected void paintEvent(WPaintDevice paintDevice) {
		WPainter painter = new WPainter(paintDevice);
		WebGraphics2D graphics = new WebGraphics2D(painter);		
		treePane.paint(graphics);
	}

	public TreePane getTreePane() {
		return treePane;
	}
}