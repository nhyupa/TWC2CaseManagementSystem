/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerBankAccountDetails {
    private String bankAccountName;
    private String bankAccountNumber;
    private String bankName;
    private String bankObsolete;
    private String FIN_Number;
    
    
    public WorkerBankAccountDetails(String bankAccountName, String bankAccountNumber, String bankName, String bankObsolete, String FIN_Number){
        this.bankAccountName = bankAccountName;
        this.bankAccountNumber = bankAccountNumber;
        this.bankName = bankName;
        this.bankObsolete = bankObsolete;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the bankAccountName
     */
    public String getBankAccountName() {
        return bankAccountName;
    }

    /**
     * @param bankAccountName the bankAccountName to set
     */
    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName;
    }

    /**
     * @return the bankAccountNumber
     */
    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    /**
     * @param bankAccountNumber the bankAccountNumber to set
     */
    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }

    /**
     * @return the bankName
     */
    public String getBankName() {
        return bankName;
    }

    /**
     * @param bankName the bankName to set
     */
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    /**
     * @return the bankObsolete
     */
    public String getBankObsolete() {
        return bankObsolete;
    }

    /**
     * @param bankObsolete the bankObsolete to set
     */
    public void setBankObsolete(String bankObsolete) {
        this.bankObsolete = bankObsolete;
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
