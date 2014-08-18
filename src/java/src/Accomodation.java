/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Accomodation {
    private String accomodationProvided;
    private String accomodationType;
    private String employerMonthlyCost;
    private String selfPaidCost;
    private String FIN;
    
    public Accomodation(String accomodationProvided, String accomodationType, String employerMonthlyCost, String selfPaidCost, String FIN){
        this.accomodationProvided = accomodationProvided;
        this.accomodationType = accomodationType;
        this.employerMonthlyCost = employerMonthlyCost;
        this.selfPaidCost =selfPaidCost;
        this.FIN = FIN;
    }

    /**
     * @return the accomodationProvided
     */
    public String getAccomodationProvided() {
        return accomodationProvided;
    }

    /**
     * @param accomodationProvided the accomodationProvided to set
     */
    public void setAccomodationProvided(String accomodationProvided) {
        this.accomodationProvided = accomodationProvided;
    }

    /**
     * @return the accomodationType
     */
    public String getAccomodationType() {
        return accomodationType;
    }

    /**
     * @param accomodationType the accomodationType to set
     */
    public void setAccomodationType(String accomodationType) {
        this.accomodationType = accomodationType;
    }

    /**
     * @return the employerMonthlyCost
     */
    public String getEmployerMonthlyCost() {
        return employerMonthlyCost;
    }

    /**
     * @param employerMonthlyCost the employerMonthlyCost to set
     */
    public void setEmployerMonthlyCost(String employerMonthlyCost) {
        this.employerMonthlyCost = employerMonthlyCost;
    }

    /**
     * @return the selfPaidCost
     */
    public String getSelfPaidCost() {
        return selfPaidCost;
    }

    /**
     * @param selfPaidCost the selfPaidCost to set
     */
    public void setSelfPaidCost(String selfPaidCost) {
        this.selfPaidCost = selfPaidCost;
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
}
