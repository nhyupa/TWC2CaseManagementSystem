/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Lawyer {
    private String lawyerUpdate;
    private String lawyerHave;
    private String lawyerFirm;
    private String lawyerRemarks;
    private String FIN_Number;
    
    public Lawyer(String lawyerUpdate, String lawyerHave, String lawyerFirm, String lawyerRemarks, String FIN_Number){
        this.lawyerUpdate = lawyerUpdate;
        this.lawyerHave = lawyerHave;
        this.lawyerFirm = lawyerFirm;
        this.lawyerRemarks = lawyerRemarks;
        this.FIN_Number = FIN_Number;
       
    }

    /**
     * @return the lawyerUpdate
     */
    public String getLawyerUpdate() {
        return lawyerUpdate;
    }

    /**
     * @param lawyerUpdate the lawyerUpdate to set
     */
    public void setLawyerUpdate(String lawyerUpdate) {
        this.lawyerUpdate = lawyerUpdate;
    }

    /**
     * @return the lawyerHave
     */
    public String getLawyerHave() {
        return lawyerHave;
    }

    /**
     * @param lawyerHave the lawyerHave to set
     */
    public void setLawyerHave(String lawyerHave) {
        this.lawyerHave = lawyerHave;
    }

    /**
     * @return the lawyerFirm
     */
    public String getLawyerFirm() {
        return lawyerFirm;
    }

    /**
     * @param lawyerFirm the lawyerFirm to set
     */
    public void setLawyerFirm(String lawyerFirm) {
        this.lawyerFirm = lawyerFirm;
    }

    /**
     * @return the lawyerRemarks
     */
    public String getLawyerRemarks() {
        return lawyerRemarks;
    }

    /**
     * @param lawyerRemarks the lawyerRemarks to set
     */
    public void setLawyerRemarks(String lawyerRemarks) {
        this.lawyerRemarks = lawyerRemarks;
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
