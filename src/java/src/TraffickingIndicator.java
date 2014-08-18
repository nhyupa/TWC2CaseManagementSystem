/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class TraffickingIndicator {
    private String assessmentDate;
    private String assessmentPerson;
    private String traffickingComplaint;
    private String otherTrafficking;
    private String FIN;
    
    public TraffickingIndicator(String assessmentDate, String assessmentPerson, String traffickingComplaint, String otherTrafficking, String FIN){
        this.assessmentDate = assessmentDate;
        this.assessmentPerson = assessmentPerson;
        this.traffickingComplaint = traffickingComplaint;
        this.otherTrafficking = otherTrafficking;
        this.FIN = FIN;
    }

    /**
     * @return the assessmentDate
     */
    public String getAssessmentDate() {
        return assessmentDate;
    }

    /**
     * @param assessmentDate the assessmentDate to set
     */
    public void setAssessmentDate(String assessmentDate) {
        this.assessmentDate = assessmentDate;
    }

    /**
     * @return the assessmentPerson
     */
    public String getAssessmentPerson() {
        return assessmentPerson;
    }

    /**
     * @param assessmentPerson the assessmentPerson to set
     */
    public void setAssessmentPerson(String assessmentPerson) {
        this.assessmentPerson = assessmentPerson;
    }

    /**
     * @return the traffickingComplaint
     */
    public String getTraffickingComplaint() {
        return traffickingComplaint;
    }

    /**
     * @param traffickingComplaint the traffickingComplaint to set
     */
    public void setTraffickingComplaint(String traffickingComplaint) {
        this.traffickingComplaint = traffickingComplaint;
    }

    /**
     * @return the otherTrafficking
     */
    public String getOtherTrafficking() {
        return otherTrafficking;
    }

    /**
     * @param otherTrafficking the otherTrafficking to set
     */
    public void setOtherTrafficking(String otherTrafficking) {
        this.otherTrafficking = otherTrafficking;
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
