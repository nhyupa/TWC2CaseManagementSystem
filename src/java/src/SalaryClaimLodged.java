/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class SalaryClaimLodged {
    private String salClaimDate;
    private String salClaimLoss;
    private String salClaimBasis;
    private String FIN_Number;
    
    public SalaryClaimLodged(String salClaimDate, String salClaimLoss, String salClaimBasis, String FIN_Number){
        this.salClaimDate = salClaimDate;
        this.salClaimLoss = salClaimLoss;
        this.salClaimBasis = salClaimBasis;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the salClaimDate
     */
    public String getSalClaimDate() {
        return salClaimDate;
    }

    /**
     * @param salClaimDate the salClaimDate to set
     */
    public void setSalClaimDate(String salClaimDate) {
        this.salClaimDate = salClaimDate;
    }

    /**
     * @return the salClaimLoss
     */
    public String getSalClaimLoss() {
        return salClaimLoss;
    }

    /**
     * @param salClaimLoss the salClaimLoss to set
     */
    public void setSalClaimLoss(String salClaimLoss) {
        this.salClaimLoss = salClaimLoss;
    }

    /**
     * @return the salClaimBasis
     */
    public String getSalClaimBasis() {
        return salClaimBasis;
    }

    /**
     * @param salClaimBasis the salClaimBasis to set
     */
    public void setSalClaimBasis(String salClaimBasis) {
        this.salClaimBasis = salClaimBasis;
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
