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
public class WicaClaim{
    
    private String FIN = null; 
    private Date WicaClaimDate = null;
    private String WicaRefNbr = null;
   private String WicaInsurer = null;
   private String WicaPolicyNbr = null;
   private String WicaClaimReason = null;
   private String WicaClaimRem = null;
  


    public WicaClaim(String FIN, Date WicaClaimDate, String WicaRefNbr, String WicaInsurer, String WicaPolicyNbr, String WicaClaimReason, String WicaClaimRem){
        
        this.FIN = FIN;
        this.WicaClaimDate = WicaClaimDate;
		this.WicaRefNbr = WicaRefNbr;
		this.WicaInsurer = WicaInsurer;
		this.WicaPolicyNbr = WicaPolicyNbr;
		this.WicaClaimReason = WicaClaimReason;
		this.WicaClaimRem = WicaClaimRem;
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
     * @return the WicaClaimDate
     */
    public Date getWicaClaimDate() {
        return WicaClaimDate;
    }

    /**
     * @param WicaClaimDate the WicaClaimDate to set
     */
    public void setWicaClaimDate(Date WicaClaimDate) {
        this.WicaClaimDate = WicaClaimDate;
    }

    /**
     * @return the WicaRefNbr
     */
    public String getWicaRefNbr() {
        return WicaRefNbr;
    }

    /**
     * @param WicaRefNbr the WicaRefNbr to set
     */
    public void setWicaRefNbr(String WicaRefNbr) {
        this.WicaRefNbr = WicaRefNbr;
    }

    /**
     * @return the WicaInsurer
     */
    public String getWicaInsurer() {
        return WicaInsurer;
    }

    /**
     * @param WicaInsurer  to set
     */
    public void setWicaInsurer(String WicaInsurer) {
        this.WicaInsurer = WicaInsurer;
    }

    /**
     * @return the WicaPolicyNbr
     */
    public String getWicaPolicyNbr() {
        return WicaPolicyNbr;
    }

    /**
     * @param WicaPolicyNbr the WicaPolicyNbr to set
     */
    public void setWicaPolicyNbr(String WicaPolicyNbr) {
        this.WicaPolicyNbr = WicaPolicyNbr;
    }

    /**
     * @return the WicaClaimReason
     */
    public String getWicaClaimReason() {
        return WicaClaimReason;
    }

    /**
     * @param WicaClaimReason the WicaClaimReason to set
     */
    public void setWicaClaimReason(String WicaClaimReason) {
        this.WicaClaimReason = WicaClaimReason;
    }

	 /**
     * @return the WicaClaimRem
     */
    public String getWicaClaimRem() {
        return WicaClaimRem;
    }

    /**
     * @param WicaClaimRem the WicaClaimRem to set
     */
    public void setWicaClaimRem(String WicaClaimRem) {
        this.WicaClaimRem = WicaClaimRem;
    }
	
}
