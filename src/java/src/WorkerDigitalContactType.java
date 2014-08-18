/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerDigitalContactType {
    private String digitalContactType;
    private String emailAddress;
    private String electronicContactOwner;
    private String digitalRemarks;
    private String obsoleteDate;
    private String FIN_Number;
    
    public WorkerDigitalContactType(String digitalContactType, String emailAddress, String electronicContactOwner, String digitalRemarks, String obsoleteDate, String FIN_Number){
        this.digitalContactType = digitalContactType;
        this.emailAddress = emailAddress;
        this.electronicContactOwner = electronicContactOwner;
        this.digitalRemarks = digitalRemarks;
        this.obsoleteDate = obsoleteDate;
        this.FIN_Number  = FIN_Number;
    }

    /**
     * @return the digitalContactType
     */
    public String getDigitalContactType() {
        return digitalContactType;
    }

    /**
     * @param digitalContactType the digitalContactType to set
     */
    public void setDigitalContactType(String digitalContactType) {
        this.digitalContactType = digitalContactType;
    }

    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the electronicContactOwner
     */
    public String getElectronicContactOwner() {
        return electronicContactOwner;
    }

    /**
     * @param electronicContactOwner the electronicContactOwner to set
     */
    public void setElectronicContactOwner(String electronicContactOwner) {
        this.electronicContactOwner = electronicContactOwner;
    }

    /**
     * @return the digitalRemarks
     */
    public String getDigitalRemarks() {
        return digitalRemarks;
    }

    /**
     * @param digitalRemarks the digitalRemarks to set
     */
    public void setDigitalRemarks(String digitalRemarks) {
        this.digitalRemarks = digitalRemarks;
    }

    /**
     * @return the obsoleteDate
     */
    public String getObsoleteDate() {
        return obsoleteDate;
    }

    /**
     * @param obsoleteDate the obsoleteDate to set
     */
    public void setObsoleteDate(String obsoleteDate) {
        this.obsoleteDate = obsoleteDate;
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
