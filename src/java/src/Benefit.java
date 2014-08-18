/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Benefit {
    private String benefitGivenDate;
    private String benefitType;
    private String benefitPurpose;
    private String benefitValue;
    private String FIN_Number;
    
    public Benefit(String benefitGivenDate, String benefitType, String benefitPurpose,String benefitValue, String FIN_Number){
        this.benefitGivenDate = benefitGivenDate;
        this.benefitType = benefitType;
        this.benefitPurpose = benefitPurpose;
        this.benefitValue = benefitValue;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the benefitGivenDate
     */
    public String getBenefitGivenDate() {
        return benefitGivenDate;
    }

    /**
     * @param benefitGivenDate the benefitGivenDate to set
     */
    public void setBenefitGivenDate(String benefitGivenDate) {
        this.benefitGivenDate = benefitGivenDate;
    }

    /**
     * @return the benefitType
     */
    public String getBenefitType() {
        return benefitType;
    }

    /**
     * @param benefitType the benefitType to set
     */
    public void setBenefitType(String benefitType) {
        this.benefitType = benefitType;
    }

    /**
     * @return the benefitPurpose
     */
    public String getBenefitPurpose() {
        return benefitPurpose;
    }

    /**
     * @param benefitPurpose the benefitPurpose to set
     */
    public void setBenefitPurpose(String benefitPurpose) {
        this.benefitPurpose = benefitPurpose;
    }

    /**
     * @return the benefitValue
     */
    public String getBenefitValue() {
        return benefitValue;
    }

    /**
     * @param benefitValue the benefitValue to set
     */
    public void setBenefitValue(String benefitValue) {
        this.benefitValue = benefitValue;
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
    public void setFIN_Number(String FIN_Number) {
        this.FIN_Number = FIN_Number;
    }
}
