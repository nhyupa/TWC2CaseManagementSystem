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
public class R2R {
    private int ID = 0;
    private String FIN = null; 
    private Date R2RDate = null;
    private String R2RTime = null;
   private String R2RHosp = null;
   private String R2RDept = null;
   private String R2R1 = null;
   private String R2R2 = null;
   private String R2RPurpose = null;
   private String R2RPreApptNotes = null;
   private String R2RPostApptNotes = null;
   private String R2RFeedback = null;
   private double R2RMedCost = 0;
   private double R2ROutlay = 0;
   private String FIN_Number = null;
    
    public R2R(String FIN, Date R2RDate, String R2RTime, String R2RHosp, String R2RDept, String R2R1, String R2R2, String R2RPurpose, String R2RPreApptNotes){
        
        this.FIN = FIN;
        this.R2RDate = R2RDate;
		this.R2RTime = R2RTime;
		this.R2RHosp = R2RHosp;
		this.R2RDept = R2RDept;
		this.R2R1 = R2R1;
		this.R2R2 = R2R2;
		this.R2RPurpose = R2RPurpose;
		this.R2RPreApptNotes = R2RPreApptNotes;
    }
    
     public R2R( Date R2RDate, String R2RTime, String R2RHosp, String R2RDept, String R2R1, String R2R2, String R2RPurpose, String R2RPreApptNotes){
        
        this.FIN = FIN;
        this.R2RDate = R2RDate;
		this.R2RTime = R2RTime;
		this.R2RHosp = R2RHosp;
		this.R2RDept = R2RDept;
		this.R2R1 = R2R1;
		this.R2R2 = R2R2;
		this.R2RPurpose = R2RPurpose;
		this.R2RPreApptNotes = R2RPreApptNotes;
    }
    
      public R2R( int ID, String FIN, Date R2RDate, String R2RTime, String R2RHosp, String R2RDept, String R2R1, String R2R2, String R2RPurpose, String R2RPreApptNotes){
        this.ID = ID;
        this.FIN = FIN;
        this.R2RDate = R2RDate;
		this.R2RTime = R2RTime;
		this.R2RHosp = R2RHosp;
		this.R2RDept = R2RDept;
		this.R2R1 = R2R1;
		this.R2R2 = R2R2;
		this.R2RPurpose = R2RPurpose;
		this.R2RPreApptNotes = R2RPreApptNotes;
    }

	public R2R( int ID, String FIN, Date R2RDate, String R2RTime, String R2RHosp, String R2RDept, String R2R1, String R2R2, String R2RPurpose, String R2RPreApptNotes, String R2RPostApptNotes, String R2RFeedback, double R2RMedCost, double R2ROutlay){
        this.ID = ID;
        this.FIN = FIN;
        this.R2RDate = R2RDate;
		this.R2RTime = R2RTime;
		this.R2RHosp = R2RHosp;
		this.R2RDept = R2RDept;
		this.R2R1 = R2R1;
		this.R2R2 = R2R2;
		this.R2RPurpose = R2RPurpose;
		this.R2RPreApptNotes = R2RPreApptNotes;
                this.R2RPostApptNotes = R2RPostApptNotes;
                this.R2RFeedback = R2RFeedback;
                this.R2RMedCost = R2RMedCost;
                this.R2ROutlay = R2ROutlay;
    }
	
 /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
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
     * @return the R2RDate
     */
    public Date getR2RDate() {
        return R2RDate;
    }

    /**
     * @param R2RDate the R2RDate to set
     */
    public void setR2RDate(Date R2RDate) {
        this.R2RDate = R2RDate;
    }

    /**
     * @return the R2RTime
     */
    public String getR2RTime() {
        return R2RTime;
    }

    /**
     * @param R2RTime the R2RTime to set
     */
    public void setR2RTime(String R2RTime) {
        this.R2RTime = R2RTime;
    }

    /**
     * @return the R2RHosp
     */
    public String getR2RHosp() {
        return R2RHosp;
    }

    /**
     * @param R2RHosp  to set
     */
    public void setR2RHosp(String R2RHosp) {
        this.R2RHosp = R2RHosp;
    }

    /**
     * @return the R2RDept
     */
    public String getR2RDept() {
        return R2RDept;
    }

    /**
     * @param R2RDept the R2RDept to set
     */
    public void setR2RDept(String R2RDept) {
        this.R2RDept = R2RDept;
    }

    /**
     * @return the R2R1
     */
    public String getR2R1() {
        return R2R1;
    }

    /**
     * @param R2R1 the R2R1 to set
     */
    public void setR2R1(String R2R1) {
        this.R2R1 = R2R1;
    }

	 /**
     * @return the R2R2
     */
    public String getR2R2() {
        return R2R2;
    }

    /**
     * @param R2R2 the R2R2 to set
     */
    public void setR2R2(String R2R2) {
        this.R2R2 = R2R2;
    }
	
    /**
     * @return the R2RPurpose
     */
    public String getR2RPurpose() {
        return R2RPurpose;
    }

    /**
     * @param R2RPurpose the R2RPurpose to set
     */
    public void setR2RPurpose(String R2RPurpose) {
        this.R2RPurpose = R2RPurpose;
    }

    /**
     * @return the R2RPreApptNotes
     */
    public String getR2RPreApptNotes() {
        return R2RPreApptNotes;
    }

    /**
     * @param R2RPreApptNotes the R2RPreApptNotes to set
     */
    public void setR2RPreApptNotes(String R2RPreApptNotes) {
        this.R2RPreApptNotes = R2RPreApptNotes;
    }
    /**
     * @return the R2RPostApptNotes
     */
    public String getR2RPostApptNotes() {
        return R2RPostApptNotes;
    }

    /**
     * @param R2RPostApptNotes the R2RPostApptNotes to set
     */
    public void setR2RPostApptNotes(String R2RPostApptNotes) {
        this.R2RPostApptNotes = R2RPostApptNotes;
    }
    
    /**
     * @return the R2RFeedback
     */
    public String getR2RFeedback() {
        return R2RFeedback;
    }

    /**
     * @param R2RFeedback the R2RFeedback to set
     */
    public void setR2RFeedback(String R2RFeedback) {
        this.R2RFeedback = R2RFeedback;
    }
    
     /**
     * @return the R2RMedCost
     */
    public double getR2RMedCost() {
        return R2RMedCost;
    }

    /**
     * @param R2RMedCost the R2RMedCost to set
     */
    public void setR2RMedCostdouble(double R2RMedCost) {
        this.R2RMedCost = R2RMedCost;
    }
    
     /**
     * @return the R2ROutlay
     */
    public double getR2ROutlay() {
        return R2ROutlay;
    }

    /**
     * @param R2ROutlay the R2ROutlay to set
     */
    public void setR2ROutlay (double R2ROutlay) {
        this.R2ROutlay = R2ROutlay;
    }
    
      /**
     * @return the FIN_Number
     */
    public String getFIN_Number() {
        return FIN_Number;
    }

    /**
     * @param FIN_Number the FIN_Number to set
     */
    public void setFIN_Number (String FIN_Number) {
        this.FIN_Number = FIN_Number;
    }
    
    
    
}
