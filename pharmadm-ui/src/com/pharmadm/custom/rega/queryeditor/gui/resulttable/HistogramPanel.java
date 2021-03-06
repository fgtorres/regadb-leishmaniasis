
/*
 * (C) Copyright 2000-2007 PharmaDM n.v. All rights reserved.
 * 
 * This file is licensed under the terms of the GNU General Public License (GPL) version 2.
 * See http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
package com.pharmadm.custom.rega.queryeditor.gui.resulttable;

import java.util.*;
import java.awt.event.*;
import java.awt.*;
import java.awt.geom.*;
import javax.swing.*;
import javax.swing.event.*;

import com.pharmadm.num.dhb.DhbScientificCurves.Histogram;
import com.pharmadm.num.dhb.DhbStatistics.StatisticalMoments;
import com.pharmadm.util.gui.chart.ColorBar;

/**
 * Based on com.pharmadm.dmax.cube.HistogramPanel.
 *
 * @author  ldh, kdg
 */
public class HistogramPanel extends javax.swing.JPanel {
    
    private final Histogram histogram;
    private final StatisticalMoments moments;
    private Graphics2D g2;
    private Rectangle2D.Double rect;
    private Line2D.Double line;
    private double width;
    private double height;
    private double minX;
    private double minY;
    private double maxX;
    private double maxY;
    
    private final Font axisLabelFont = new Font("Dialog",0,10);
    private final ColorBar colorBar = new ColorBar();
    
    private static double BORDERSIZE = 10.0;
    private static double TEXTSIZE = 20.0;
    
    /** Creates new form HistogramPanel
     *
     * @pre histogram != null
     *
     * @param histogram the histogram to be drawn in this panel
     * @param moments the statistical moments correponding to the histogram, if available. may be null.
     */
    public HistogramPanel(Histogram histogram, StatisticalMoments moments) {
        this.histogram = histogram;
        this.moments = moments;
        initComponents();
        this.rect = new Rectangle2D.Double();
        this.line = new Line2D.Double();
        this.setOpaque(false);
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    private void initComponents() {//GEN-BEGIN:initComponents

        setLayout(new java.awt.BorderLayout());

    }//GEN-END:initComponents
    
    protected void paintComponent(Graphics graphics) {
        this.g2 = (Graphics2D)graphics;
        this.g2.translate(BORDERSIZE,BORDERSIZE);
        this.width = this.getWidth()-2*BORDERSIZE;
        this.height = this.getHeight()-2*BORDERSIZE;
        drawBins(Color.white, true);
        drawBins(Color.black, false);
        drawAverage();
        drawAxisLabels();
    }
    
    /**
     * Draws the average if it is known.
     */
    private void drawAverage() {
        if (moments != null) {
            double diff = histogram.getRange()[1] + histogram.getBinWidth() - histogram.getRange()[0];
            if (diff > 0) {
                double avgDiff = moments.average() - histogram.getRange()[0];
                double avgProp = avgDiff/diff;
                double xLine = TEXTSIZE + (this.width-2*TEXTSIZE) * avgProp;
                this.line.setLine(xLine,this.height,xLine,this.height-TEXTSIZE);
                g2.setColor(Color.gray);
                g2.draw(line);
            }
        }
    }
    
    private void drawAxisLabels() {
        g2.setFont(axisLabelFont);
        g2.setColor(Color.gray);
        String s = "0";
        int stringWidth = g2.getFontMetrics().stringWidth(s);
        g2.drawString(s, (float)(TEXTSIZE-5-stringWidth), (float)(this.height-TEXTSIZE));
        s = Integer.toString((int)Math.round(histogram.getRange()[3]));
        stringWidth = g2.getFontMetrics().stringWidth(s);
        g2.drawString(s, (float)(TEXTSIZE-5-stringWidth), 5.f);
/*
        if (this.statisticsPanel.getSelectedCube() != null) {
            s = "0";
            stringWidth = g2.getFontMetrics().stringWidth(s);
            this.rect.setFrame((this.width-TEXTSIZE+5), this.height-TEXTSIZE-10, stringWidth,12);
            g2.setColor(Color.black);
            g2.fill(this.rect);
            g2.setColor(Color.white);
            g2.drawString(s, (float)(this.width-TEXTSIZE+5), (float)(this.height-TEXTSIZE));
            s = Integer.toString((int)Math.round(histogram.getRange()[3]));
            stringWidth = g2.getFontMetrics().stringWidth(s);
            this.rect.setFrame((this.width-TEXTSIZE+5), -5.0, stringWidth,12);
            g2.setColor(Color.black);
            g2.fill(this.rect);
            g2.setColor(Color.white);
            g2.drawString(s, (float)(this.width-TEXTSIZE+5), 5.f);
        }
 */
        g2.setColor(Color.black);
        s = Double.toString(Math.round(histogram.getRange()[0]*100.0)/100.0);
        g2.drawString(s, (float)(TEXTSIZE), (float)this.height);
        s = Double.toString(Math.round((histogram.getRange()[1] + histogram.getBinWidth()) * 100.0) / 100.0);
        stringWidth = g2.getFontMetrics().stringWidth(s);
        g2.drawString(s, (float)(this.width-TEXTSIZE-stringWidth), (float)this.height);
    }
    
    private void drawBins(Color color, boolean filled) {
        double[] range = histogram.getRange();
        this.minX = range[0];
        this.maxX = range[1]+histogram.getBinWidth(); // range[1] = left limit of last bin
        this.minY = range[2];
        this.maxY = range[3];
        double rectWidth = (this.width-2*TEXTSIZE)/histogram.getDimension();
        double lastY = this.height-TEXTSIZE;
        this.g2.setColor(color);
        
        for (int i = 0; i <  histogram.getDimension(); i++) {
            double rectHeight = (histogram.yValueAt(i)/maxY) * (this.height-TEXTSIZE);
            double rectX = TEXTSIZE + i * rectWidth;
            double rectY = (this.height-TEXTSIZE) - rectHeight;
            if (filled) {
                this.rect.setFrame(rectX,rectY,rectWidth,rectHeight);
                this.g2.setColor(colorBar.getColor(histogram.xValueAt(i), histogram.getMinimum(), histogram.getMaximum()));
                this.g2.fill(rect);
                this.g2.setColor(Color.black);
            } else {
                this.line.setLine(rectX,lastY, rectX,rectY);
                this.g2.draw(line);
                this.line.setLine(rectX,rectY,rectX+rectWidth,rectY);
                this.g2.draw(line);
                lastY = rectY;
            }
        }
        if (!filled) {
            double rectX = TEXTSIZE + histogram.getDimension()*rectWidth;
            this.line.setLine(rectX,lastY,rectX,this.height-TEXTSIZE);
            this.g2.draw(line);
            this.line.setLine(TEXTSIZE,this.height-TEXTSIZE,rectX,this.height-TEXTSIZE);
            this.g2.draw(line);
        }
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
