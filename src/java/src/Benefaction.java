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
public class Benefaction {
    private int ID = 0;
    private String FIN = null; 
    private String JobKey = null;
    private String ProbKey = null;
    private Date BeneDate = null;
    private String BeneGiver = null;
   private String BeneType = null;
   private String BeneTypeMore = null;
   private String BeneSerial = null;
   private String BenePurpose = null;
   private String BeneRem = null;
   private String BeneValue = null;
    
   
   public Benefaction(int ID, String FIN, Date BeneDate, String BeneGiver, String BeneType, String BeneSerial, String BenePurpose, String BeneRem, String BeneValue){
        this.ID=ID;
        this.FIN = FIN;
        this.BeneDate = BeneDate;
		this.BeneGiver = BeneGiver;
		this.BeneType = BeneType;
		this.BeneSerial = BeneSerial;
		this.BenePurpose = BenePurpose;
		this.BeneRem = BeneRem;
		this.BeneValue = BeneValue;
    }
   
    
    public Benefaction(String FIN, Date BeneDate, String BeneGiver, String BeneType, String BeneSerial, String BenePurpose, String BeneRem, String BeneValue){
        
        this.FIN = FIN;
        this.BeneDate = BeneDate;
		this.BeneGiver = BeneGiver;
		this.BeneType = BeneType;
		this.BeneSerial = BeneSerial;
		this.BenePurpose = BenePurpose;
		this.BeneRem = BeneRem;
		this.BeneValue = BeneValue;
    }

    public Benefaction( Date BeneDate, String BeneGiver, String BeneType, String BeneSerial, String BenePurpose, String BeneRem, String BeneValue){
        
        this.BeneDate = BeneDate;
		this.BeneGiver = BeneGiver;
		this.BeneType = BeneType;
		this.BeneSerial = BeneSerial;
		this.BenePurpose = BenePurpose;
		this.BeneRem = BeneRem;
		this.BeneValue = BeneValue;
    }
    
     public Benefaction(int ID, Date BeneDate, String BeneGiver, String BeneType, String BeneSerial, String BenePurpose, String BeneRem, String BeneValue){
        this.ID = ID;
        this.BeneDate = BeneDate;
		this.BeneGiver = BeneGiver;
		this.BeneType = BeneType;
		this.BeneSerial = BeneSerial;
		this.BenePurpose = BenePurpose;
		this.BeneRem = BeneRem;
		this.BeneValue = BeneValue;
    }
     
     public Benefaction(int ID, Date BeneDate,String JobKey, String ProbKey, String BeneGiver, String BeneType, String BeneSerial, String BenePurpose, String BeneRem, String BeneValue){
        this.ID = ID;
        this.BeneDate = BeneDate;
        this.JobKey = JobKey;
        this.ProbKey = ProbKey;
		this.BeneGiver = BeneGiver;
		this.BeneType = BeneType;
		this.BeneSerial = BeneSerial;
		this.BenePurpose = BenePurpose;
		this.BeneRem = BeneRem;
		this.BeneValue = BeneValue;
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
     * @return the JobKey
     */
    public String getJobKey() {
        return JobKey;
    }

    /**
     * @param JobKey the JobKey to set
     */
    public void setJobKey(String JobKey) {
        this.JobKey = JobKey;
    }
    
     /**
     * @return the ProbKey
     */
    public String getProbKey() {
        return ProbKey;
    }

    /**
     * @param ProbKey the ProbKey to set
     */
    public void setProbKey(String ProbKey) {
        this.ProbKey = ProbKey;
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
     * @return the BeneDate
     */
    public Date getBeneDate() {
        return BeneDate;
    }

    /**
     * @param BeneDate the BeneDate to set
     */
    public void setBeneDate(Date BeneDate) {
        this.BeneDate = BeneDate;
    }

    /**
     * @return the BeneGiver
     */
    public String getBeneGiver() {
        return BeneGiver;
    }

    /**
     * @param BeneGiver the BeneGiver to set
     */
    public void setBeneGiver(String BeneGiver) {
        this.BeneGiver = BeneGiver;
    }

    /**
     * @return the BeneType
     */
    public String getBeneType() {
        return BeneType;
    }

    /**
     * @param BeneType  to set
     */
    public void setBeneType(String BeneType) {
        this.BeneType = BeneType;
    }

    /**
     * @return the BeneSerial
     */
    public String getBeneSerial() {
        return BeneSerial;
    }

    /**
     * @param BeneSerial the BeneSerial to set
     */
    public void setBeneSerial(String BeneSerial) {
        this.BeneSerial = BeneSerial;
    }

    /**
     * @return the BenePurpose
     */
    public String getBenePurpose() {
        return BenePurpose;
    }

    /**
     * @param BenePurpose the BenePurpose to set
     */
    public void setBenePurpose(String BenePurpose) {
        this.BenePurpose = BenePurpose;
    }

    /**
     * @return the BeneRem
     */
    public String getBeneRem() {
        return BeneRem;
    }

    /**
     * @param BeneRem the BeneRem to set
     */
    public void setBeneRem(String BeneRem) {
        this.BeneRem = BeneRem;
    }

    /**
     * @return the BeneValue
     */
    public String getBeneValue() {
        return BeneValue;
    }

    /**
     * @param BeneValue the BeneValue to set
     */
    public void setBeneValue(String BeneValue) {
        this.BeneValue = BeneValue;
    }
}
