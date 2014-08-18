/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class IllnessHistory {
    private String illnessBegan;
    private String illnessNature;
    private String diagnosedIllness;
    private String workRelatedIllness;
    private String FIN_Number;
    
    public IllnessHistory(String illnessBegan,String illnessNature, String diagnosedIllness, String workRelatedIllness, String FIN_Number){
        this.illnessBegan = illnessBegan;
        this.illnessNature = illnessNature;
        this.diagnosedIllness = diagnosedIllness;
        this.workRelatedIllness = workRelatedIllness;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the illnessBegan
     */
    public String getIllnessBegan() {
        return illnessBegan;
    }

    /**
     * @param illnessBegan the illnessBegan to set
     */
    public void setIllnessBegan(String illnessBegan) {
        this.illnessBegan = illnessBegan;
    }

    /**
     * @return the illnessNature
     */
    public String getIllnessNature() {
        return illnessNature;
    }

    /**
     * @param illnessNature the illnessNature to set
     */
    public void setIllnessNature(String illnessNature) {
        this.illnessNature = illnessNature;
    }

    /**
     * @return the diagnosedIllness
     */
    public String getDiagnosedIllness() {
        return diagnosedIllness;
    }

    /**
     * @param diagnosedIllness the diagnosedIllness to set
     */
    public void setDiagnosedIllness(String diagnosedIllness) {
        this.diagnosedIllness = diagnosedIllness;
    }

    /**
     * @return the workRelatedIllness
     */
    public String getWorkRelatedIllness() {
        return workRelatedIllness;
    }

    /**
     * @param workRelatedIllness the workRelatedIllness to set
     */
    public void setWorkRelatedIllness(String workRelatedIllness) {
        this.workRelatedIllness = workRelatedIllness;
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
