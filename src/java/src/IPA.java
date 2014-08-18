/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class IPA {
    private String workpassSpecified;
    private String ipaEmployerName;
    private String ipaBasicMonthlySalary;
    private String ipaDeductions;
    private String FIN;
    
    
    public IPA(String workpassSpecified,String ipaEmployerName,String ipaBasicMonthlySalary,String ipaDeductions,String FIN){
        this.workpassSpecified = workpassSpecified;
        this.ipaEmployerName = ipaEmployerName;
        this.ipaBasicMonthlySalary = ipaBasicMonthlySalary;
        this.ipaDeductions = ipaDeductions;
        this.FIN = FIN;
    }

    /**
     * @return the workpassSpecified
     */
    public String getWorkpassSpecified() {
        return workpassSpecified;
    }

    /**
     * @param workpassSpecified the workpassSpecified to set
     */
    public void setWorkpassSpecified(String workpassSpecified) {
        this.workpassSpecified = workpassSpecified;
    }

    /**
     * @return the ipaEmployerName
     */
    public String getIpaEmployerName() {
        return ipaEmployerName;
    }

    /**
     * @param ipaEmployerName the ipaEmployerName to set
     */
    public void setIpaEmployerName(String ipaEmployerName) {
        this.ipaEmployerName = ipaEmployerName;
    }

    /**
     * @return the ipaBasicMonthlySalary
     */
    public String getIpaBasicMonthlySalary() {
        return ipaBasicMonthlySalary;
    }

    /**
     * @param ipaBasicMonthlySalary the ipaBasicMonthlySalary to set
     */
    public void setIpaBasicMonthlySalary(String ipaBasicMonthlySalary) {
        this.ipaBasicMonthlySalary = ipaBasicMonthlySalary;
    }

    /**
     * @return the ipaDeductions
     */
    public String getIpaDeductions() {
        return ipaDeductions;
    }

    /**
     * @param ipaDeductions the ipaDeductions to set
     */
    public void setIpaDeductions(String ipaDeductions) {
        this.ipaDeductions = ipaDeductions;
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
