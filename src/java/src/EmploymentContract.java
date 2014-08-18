/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class EmploymentContract {
    private String contractDate;
    private String contractSignedPlace;
    private String contractRelationship;
    private String contractBasicSalary;
    private String FIN;
    
    public EmploymentContract(String contractDate, String contractSignedPlace, String contractRelationship, String contractBasicSalary, String FIN){
        this.contractDate = contractDate;
        this.contractSignedPlace =contractSignedPlace;
        this.contractRelationship = contractRelationship;
        this.contractBasicSalary = contractBasicSalary;
        this.FIN = FIN;
    }

    /**
     * @return the contractDate
     */
    public String getContractDate() {
        return contractDate;
    }

    /**
     * @param contractDate the contractDate to set
     */
    public void setContractDate(String contractDate) {
        this.contractDate = contractDate;
    }

    /**
     * @return the contractSignedPlace
     */
    public String getContractSignedPlace() {
        return contractSignedPlace;
    }

    /**
     * @param contractSignedPlace the contractSignedPlace to set
     */
    public void setContractSignedPlace(String contractSignedPlace) {
        this.contractSignedPlace = contractSignedPlace;
    }

    /**
     * @return the contractRelationship
     */
    public String getContractRelationship() {
        return contractRelationship;
    }

    /**
     * @param contractRelationship the contractRelationship to set
     */
    public void setContractRelationship(String contractRelationship) {
        this.contractRelationship = contractRelationship;
    }

    /**
     * @return the contractBasicSalary
     */
    public String getContractBasicSalary() {
        return contractBasicSalary;
    }

    /**
     * @param contractBasicSalary the contractBasicSalary to set
     */
    public void setContractBasicSalary(String contractBasicSalary) {
        this.contractBasicSalary = contractBasicSalary;
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
