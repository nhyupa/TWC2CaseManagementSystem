/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class PoliceReport {
    private String policeReportDate;
    private String policeStation;
    private String accompaniedPersons;
    private String policeReportDetails;
    private String policeReportRemarks;
    private String FIN_Number;
    
    public PoliceReport(String policeReportDate, String policeStation, String accompaniedPersons, String policeReportDetails, String policeReportRemarks, String FIN_Number){
        this.policeReportDate = policeReportDate;
        this.policeStation = policeStation;
        this.accompaniedPersons = accompaniedPersons;
        this.policeReportDetails = policeReportDetails;
        this.policeReportRemarks = policeReportRemarks;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the policeReportDate
     */
    public String getPoliceReportDate() {
        return policeReportDate;
    }

    /**
     * @param policeReportDate the policeReportDate to set
     */
    public void setPoliceReportDate(String policeReportDate) {
        this.policeReportDate = policeReportDate;
    }

    /**
     * @return the policeStation
     */
    public String getPoliceStation() {
        return policeStation;
    }

    /**
     * @param policeStation the policeStation to set
     */
    public void setPoliceStation(String policeStation) {
        this.policeStation = policeStation;
    }

    /**
     * @return the accompaniedPersons
     */
    public String getAccompaniedPersons() {
        return accompaniedPersons;
    }

    /**
     * @param accompaniedPersons the accompaniedPersons to set
     */
    public void setAccompaniedPersons(String accompaniedPersons) {
        this.accompaniedPersons = accompaniedPersons;
    }

    /**
     * @return the policeReportDetails
     */
    public String getPoliceReportDetails() {
        return policeReportDetails;
    }

    /**
     * @param policeReportDetails the policeReportDetails to set
     */
    public void setPoliceReportDetails(String policeReportDetails) {
        this.policeReportDetails = policeReportDetails;
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

    /**
     * @return the policeReportRemarks
     */
    public String getPoliceReportRemarks() {
        return policeReportRemarks;
    }

    /**
     * @param policeReportRemarks the policeReportRemarks to set
     */
    public void setPoliceReportRemarks(String policeReportRemarks) {
        this.policeReportRemarks = policeReportRemarks;
    }
}
