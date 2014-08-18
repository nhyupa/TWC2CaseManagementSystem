/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.util.Date;

/**
 *
 * @author nhyupa.2010
 */
public class Worker {
    private String workerRegistrationDate = null;
    private String socialWorkerName = null;
    private String createdFor  = null;
    private String workerName = null;
    private String FIN_Num = null;
    private String gender = null;
    private String nationality = null;
    private String otherNationality = null;
    private String dateOfBirth = null;
    
    /**Associate **/
    public Worker(String FIN_Num,String workerRegistrationDate, String createdFor, String socialWorkerName,String workerName, String gender, String nationality,String otherNationality){
        this.FIN_Num = FIN_Num;
        this.workerRegistrationDate = workerRegistrationDate;
        this.createdFor = createdFor;
        this.socialWorkerName = socialWorkerName;
        this.workerName = workerName;
        this.gender = gender;
        this.nationality = nationality;
        this.otherNationality = otherNationality;
    }
    
    public Worker(String FIN_Num, String workerName, String gender){
        this.FIN_Num = FIN_Num;
        this.workerName = workerName;
        this.gender = gender;
    }
    
     public Worker(String FIN_Num, String workerName, String gender, String nationality){
        this.FIN_Num = FIN_Num;
        this.workerName = workerName;
        this.gender = gender;
        this.nationality = nationality;
    }
    
    public Worker(String FIN_Num,String registrationDate,String workerName, String socialWorkerName, String gender, String nationality,String dateOfBirth){
        this.FIN_Num = FIN_Num;
        this.workerRegistrationDate = registrationDate;
        this.workerName = workerName;
        this.socialWorkerName = socialWorkerName;
        this.gender = gender;
        this.nationality = nationality;
        this.dateOfBirth = dateOfBirth;
    }
    
    public Worker(String FIN_Num,String workerRegistrationDate, String createdFor, String socialWorkerName,String workerName, String gender, String nationality,String otherNationality, String dateOfBirth){
        this.FIN_Num = FIN_Num;
        this.workerRegistrationDate = workerRegistrationDate;
        this.createdFor = createdFor;
        this.socialWorkerName = socialWorkerName;
        this.workerName = workerName;
        this.gender = gender;
        this.nationality = nationality;
        this.otherNationality = otherNationality;
        this.dateOfBirth = dateOfBirth;
    }

    public String getWorkerRegistrationDate() {
        return workerRegistrationDate;
    }

    public void setWorkerRegistrationDate(String workerRegistrationDate) {
        this.workerRegistrationDate = workerRegistrationDate;
    }

    public String getSocialWorkerName() {
        return socialWorkerName;
    }

    public void setSocialWorkerName(String socialWorkerName) {
        this.socialWorkerName = socialWorkerName;
    }

    public String getCreatedFor() {
        return createdFor;
    }

    public void setCreatedFor(String createdFor) {
        this.createdFor = createdFor;
    }

    public String getWorkerName() {
        return workerName;
    }

    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    public String getFIN_Num() {
        return FIN_Num;
    }

    public void setFIN_Num(String FIN_Num) {
        this.FIN_Num = FIN_Num;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    /**
     * @return the otherNationality
     */
    public String getOtherNationality() {
        return otherNationality;
    }

    /**
     * @param otherNationality the otherNationality to set
     */
    public void setOtherNationality(String otherNationality) {
        this.otherNationality = otherNationality;
    }
}
