/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class MC {
    private String MCUpdate;
    private String MCStatus;
    private String MCStatusMore;
    private String MCExpDate;
    private String MCDaysCulmul;
    private String MCRemarks;
    private String FIN_Number;
    
    public MC(String MCUpdate, String MCStatus, String MCStatusMore, String MCExpDate, String MCDaysCulmul, String MCRemarks, String FIN_Number){
        this.MCUpdate = MCUpdate;
        this.MCStatus = MCStatus;
        this.MCStatusMore = MCStatusMore;
        this.MCExpDate = MCExpDate;
        this.MCDaysCulmul = MCDaysCulmul;
        this.MCRemarks = MCRemarks;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the MCUpdate
     */
    public String getMCUpdate() {
        return MCUpdate;
    }

    /**
     * @param MCUpdate the MCUpdate to set
     */
    public void setMCUpdate(String MCUpdate) {
        this.MCUpdate = MCUpdate;
    }

    /**
     * @return the MCStatus
     */
    public String getMCStatus() {
        return MCStatus;
    }

    /**
     * @param MCStatus the MCStatus to set
     */
    public void setMCStatus(String MCStatus) {
        this.MCStatus = MCStatus;
    }

    /**
     * @return the MCStatusMore
     */
    public String getMCStatusMore() {
        return MCStatusMore;
    }

    /**
     * @param MCStatusMore the MCStatusMore to set
     */
    public void setMCStatusMore(String MCStatusMore) {
        this.MCStatusMore = MCStatusMore;
    }

    /**
     * @return the MCExpDate
     */
    public String getMCExpDate() {
        return MCExpDate;
    }

    /**
     * @param MCExpDate the MCExpDate to set
     */
    public void setMCExpDate(String MCExpDate) {
        this.MCExpDate = MCExpDate;
    }

    /**
     * @return the MCDaysCulmul
     */
    public String getMCDaysCulmul() {
        return MCDaysCulmul;
    }

    /**
     * @param MCDaysCulmul the MCDaysCulmul to set
     */
    public void setMCDaysCulmul(String MCDaysCulmul) {
        this.MCDaysCulmul = MCDaysCulmul;
    }

    /**
     * @return the MCRemarks
     */
    public String getMCRemarks() {
        return MCRemarks;
    }

    /**
     * @param MCRemarks the MCRemarks to set
     */
    public void setMCRemarks(String MCRemarks) {
        this.MCRemarks = MCRemarks;
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
