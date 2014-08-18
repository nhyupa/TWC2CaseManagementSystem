/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Hospital {
    private String hopitalUpdateDate;
    private String hospitalName;
    private String hospitalMore;
    private String hospitalDoctor;
    private String FIN_Number;
    
    public Hospital(String hospitalUpdateDate, String hospitalName, String hospitalMore, String hospitalDoctor, String FIN_Number){
        this.hopitalUpdateDate = hospitalUpdateDate;
        this.hospitalName = hospitalName;
        this.hospitalMore = hospitalMore;
        this.hospitalDoctor = hospitalDoctor;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the hopitalUpdateDate
     */
    public String getHopitalUpdateDate() {
        return hopitalUpdateDate;
    }

    /**
     * @param hopitalUpdateDate the hopitalUpdateDate to set
     */
    public void setHopitalUpdateDate(String hopitalUpdateDate) {
        this.hopitalUpdateDate = hopitalUpdateDate;
    }

    /**
     * @return the hospitalName
     */
    public String getHospitalName() {
        return hospitalName;
    }

    /**
     * @param hospitalName the hospitalName to set
     */
    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    /**
     * @return the hospitalMore
     */
    public String getHospitalMore() {
        return hospitalMore;
    }

    /**
     * @param hospitalMore the hospitalMore to set
     */
    public void setHospitalMore(String hospitalMore) {
        this.hospitalMore = hospitalMore;
    }

    /**
     * @return the hospitalDoctor
     */
    public String getHospitalDoctor() {
        return hospitalDoctor;
    }

    /**
     * @param hospitalDoctor the hospitalDoctor to set
     */
    public void setHospitalDoctor(String hospitalDoctor) {
        this.hospitalDoctor = hospitalDoctor;
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
