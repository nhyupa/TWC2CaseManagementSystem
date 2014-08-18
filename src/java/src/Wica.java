/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.util.Date;

/**
 *
 * @author lee
 */
public class Wica {
    
    private String FIN = null; 
    private Date WicamonUpdate = null;
    private String WicamonStatus = null;
   private String WicamonStatusMore = null;
   private double WicamonPoints = 0;
   private double WicamonDollars = 0;
   private String WicamonRem = null;
  

    public Wica(String FIN, Date WicamonUpdate, String WicamonStatus, String WicamonStatusMore, double WicamonPoints, double WicamonDollars, String WicamonRem){
        
        this.FIN = FIN;
        this.WicamonUpdate = WicamonUpdate;
		this.WicamonStatus = WicamonStatus;
		this.WicamonStatusMore = WicamonStatusMore;
		this.WicamonPoints = WicamonPoints;
		this.WicamonDollars = WicamonDollars;
		this.WicamonRem = WicamonRem;
    }

    /**
     * @return the FIN
     */
    public String getFIN() {
        return FIN;
    }

    /**
     * @param FIN the FIN to set
     */
    public void setFIN(String FIN) {
        this.FIN = FIN;
    }

    /**
     * @return the WicamonUpdate
     */
    public Date getWicamonUpdate() {
        return WicamonUpdate;
    }

    /**
     * @param WicamonUpdate the WicamonUpdate to set
     */
    public void setWicamonUpdate(Date WicamonUpdate) {
        this.WicamonUpdate = WicamonUpdate;
    }

    /**
     * @return the WicamonStatus
     */
    public String getWicamonStatus() {
        return WicamonStatus;
    }

    /**
     * @param WicamonStatus the WicamonStatus to set
     */
    public void setWicamonStatus(String WicamonStatus) {
        this.WicamonStatus = WicamonStatus;
    }

    /**
     * @return the WicamonStatusMore
     */
    public String getWicamonStatusMore() {
        return WicamonStatusMore;
    }

    /**
     * @param WicamonStatusMore  to set
     */
    public void setWicamonStatusMore(String WicamonStatusMore) {
        this.WicamonStatusMore = WicamonStatusMore;
    }

    /**
     * @return the WicamonPoints
     */
    public double getWicamonPoints() {
        return WicamonPoints;
    }

    /**
     * @param WicamonPoints the WicamonPoints to set
     */
    public void setWicamonPoints(double WicamonPoints) {
        this.WicamonPoints = WicamonPoints;
    }

    /**
     * @return the WicamonDollars
     */
    public double getWicamonDollars() {
        return WicamonDollars;
    }

    /**
     * @param WicamonDollars the WicamonDollars to set
     */
    public void setWicamonDollars(double WicamonDollars) {
        this.WicamonDollars = WicamonDollars;
    }

	 /**
     * @return the WicamonRem
     */
    public String getWicamonRem() {
        return WicamonRem;
    }

    /**
     * @param WicamonRem the WicamonRem to set
     */
    public void setWicamonRem(String WicamonRem) {
        this.WicamonRem = WicamonRem;
    }
	
}
