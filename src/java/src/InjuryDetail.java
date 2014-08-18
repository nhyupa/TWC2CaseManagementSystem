/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class InjuryDetail {
    private String injuryDate;
    private String injuryLocation;
    private String bodyPartsInjured;
    private String locationTreated;
    private String FIN;
    private String injuryTime = null;
    private String death = null;
    private String injuryHow = null;
    private String ambulance = null;
    private String initialTreatment = null;
    private String initialTreatmentMore = null;
    private String injuryWorkRelated = null;
    private String remarks = null;
    
    public InjuryDetail(String FIN, String injuryLocation, String injuryDate, String injuryTime, String death, String bodyPart, String injuryHow, String ambulance, String initialTreatment,String initialTreatmentMore, String injuryWorkRelated, String remarks){
        this.FIN = FIN;
        this.injuryLocation = injuryLocation;
        this.injuryDate = injuryDate;
        this.injuryTime = injuryTime;
        this.death = death;
        this.bodyPartsInjured = bodyPart;
        this.injuryHow = injuryHow;
        this.ambulance = ambulance;
        this.initialTreatment = initialTreatment;
        this.initialTreatmentMore = initialTreatmentMore;
        this.injuryWorkRelated = injuryWorkRelated;
        this.remarks = remarks;
    }

    public InjuryDetail(String injuryDate, String injuryLocation,String bodyPartsInjured, String locationTreated, String FIN){
        this.injuryDate = injuryDate;
        this.injuryLocation = injuryLocation;
        this.bodyPartsInjured = bodyPartsInjured;
        this.locationTreated = locationTreated;
        this.FIN = FIN;
    }

    /**
     * @return the injuryDate
     */
    public String getInjuryDate() {
        return injuryDate;
    }

    /**
     * @param injuryDate the injuryDate to set
     */
    public void setInjuryDate(String injuryDate) {
        this.injuryDate = injuryDate;
    }

    /**
     * @return the injuryLocation
     */
    public String getInjuryLocation() {
        return injuryLocation;
    }

    /**
     * @param injuryLocation the injuryLocation to set
     */
    public void setInjuryLocation(String injuryLocation) {
        this.injuryLocation = injuryLocation;
    }

    /**
     * @return the bodyPartsInjured
     */
    public String getBodyPartsInjured() {
        return bodyPartsInjured;
    }

    /**
     * @param bodyPartsInjured the bodyPartsInjured to set
     */
    public void setBodyPartsInjured(String bodyPartsInjured) {
        this.bodyPartsInjured = bodyPartsInjured;
    }

    /**
     * @return the locationTreated
     */
    public String getLocationTreated() {
        return locationTreated;
    }

    /**
     * @param locationTreated the locationTreated to set
     */
    public void setLocationTreated(String locationTreated) {
        this.locationTreated = locationTreated;
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

    /**
     * @return the injuryTime
     */
    public String getInjuryTime() {
        return injuryTime;
    }

    /**
     * @param injuryTime the injuryTime to set
     */
    public void setInjuryTime(String injuryTime) {
        this.injuryTime = injuryTime;
    }

    /**
     * @return the death
     */
    public String getDeath() {
        return death;
    }

    /**
     * @param death the death to set
     */
    public void setDeath(String death) {
        this.death = death;
    }

    /**
     * @return the injuryHow
     */
    public String getInjuryHow() {
        return injuryHow;
    }

    /**
     * @param injuryHow the injuryHow to set
     */
    public void setInjuryHow(String injuryHow) {
        this.injuryHow = injuryHow;
    }

    /**
     * @return the ambulance
     */
    public String getAmbulance() {
        return ambulance;
    }

    /**
     * @param ambulance the ambulance to set
     */
    public void setAmbulance(String ambulance) {
        this.ambulance = ambulance;
    }

    /**
     * @return the initialTreatment
     */
    public String getInitialTreatment() {
        return initialTreatment;
    }

    /**
     * @param initialTreatment the initialTreatment to set
     */
    public void setInitialTreatment(String initialTreatment) {
        this.initialTreatment = initialTreatment;
    }

    /**
     * @return the initialTreatmentMore
     */
    public String getInitialTreatmentMore() {
        return initialTreatmentMore;
    }

    /**
     * @param initialTreatmentMore the initialTreatmentMore to set
     */
    public void setInitialTreatmentMore(String initialTreatmentMore) {
        this.initialTreatmentMore = initialTreatmentMore;
    }

    /**
     * @return the injuryWorkRelated
     */
    public String getInjuryWorkRelated() {
        return injuryWorkRelated;
    }

    /**
     * @param injuryWorkRelated the injuryWorkRelated to set
     */
    public void setInjuryWorkRelated(String injuryWorkRelated) {
        this.injuryWorkRelated = injuryWorkRelated;
    }

    /**
     * @return the remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks the remarks to set
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
