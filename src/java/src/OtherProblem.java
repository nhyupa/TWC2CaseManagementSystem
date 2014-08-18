/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class OtherProblem {
    private String otherProblem;
    private String estimatedValue;
    private String otherProblemRemarks;
    private String FIN_Number;
    
    public OtherProblem(String otherProblem, String estimatedValue, String otherProblemRemarks, String FIN_Number){
        this.otherProblem = otherProblem;
        this.estimatedValue = estimatedValue;
        this.otherProblemRemarks = otherProblemRemarks;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the otherProblem
     */
    public String getOtherProblem() {
        return otherProblem;
    }

    /**
     * @param otherProblem the otherProblem to set
     */
    public void setOtherProblem(String otherProblem) {
        this.otherProblem = otherProblem;
    }

    /**
     * @return the estimatedValue
     */
    public String getEstimatedValue() {
        return estimatedValue;
    }

    /**
     * @param estimatedValue the estimatedValue to set
     */
    public void setEstimatedValue(String estimatedValue) {
        this.estimatedValue = estimatedValue;
    }

    /**
     * @return the otherProblemRemarks
     */
    public String getOtherProblemRemarks() {
        return otherProblemRemarks;
    }

    /**
     * @param otherProblemRemarks the otherProblemRemarks to set
     */
    public void setOtherProblemRemarks(String otherProblemRemarks) {
        this.otherProblemRemarks = otherProblemRemarks;
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
