/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Workplace {
    private String workplaceType;
    private String workplaceWhose;
    private String workplaceDirect;
    private String workplaceStart;
    private String FIN;
    
    public Workplace(String workplaceType,String workplaceWhose,String workplaceDirect,String workplaceStart,String FIN){
        this.workplaceType = workplaceType;
        this.workplaceWhose = workplaceWhose;
        this.workplaceDirect = workplaceDirect;
        this.workplaceStart = workplaceStart;
        this.FIN = FIN;
    }

    /**
     * @return the workplaceType
     */
    public String getWorkplaceType() {
        return workplaceType;
    }

    /**
     * @param workplaceType the workplaceType to set
     */
    public void setWorkplaceType(String workplaceType) {
        this.workplaceType = workplaceType;
    }

    /**
     * @return the workplaceWhose
     */
    public String getWorkplaceWhose() {
        return workplaceWhose;
    }

    /**
     * @param workplaceWhose the workplaceWhose to set
     */
    public void setWorkplaceWhose(String workplaceWhose) {
        this.workplaceWhose = workplaceWhose;
    }

    /**
     * @return the workplaceDirect
     */
    public String getWorkplaceDirect() {
        return workplaceDirect;
    }

    /**
     * @param workplaceDirect the workplaceDirect to set
     */
    public void setWorkplaceDirect(String workplaceDirect) {
        this.workplaceDirect = workplaceDirect;
    }

    /**
     * @return the workplaceStart
     */
    public String getWorkplaceStart() {
        return workplaceStart;
    }

    /**
     * @param workplaceStart the workplaceStart to set
     */
    public void setWorkplaceStart(String workplaceStart) {
        this.workplaceStart = workplaceStart;
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
