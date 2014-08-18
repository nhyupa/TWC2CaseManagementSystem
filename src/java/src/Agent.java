/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Agent {
    private String agentCompanyName;
    private String agentLocation;
    private String agentAmountPaid;
    private String agentAmountOwed;
    private String FIN_Number;
    
    
    public Agent(String agentCompanyName, String agentLocation, String agentAmountPaid, String agentAmountOwed,String FIN_Number){
        this.agentCompanyName = agentCompanyName;
        this.agentLocation = agentLocation;
        this.agentAmountPaid = agentAmountPaid;
        this.agentAmountOwed = agentAmountOwed;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the agentCompanyName
     */
    public String getAgentCompanyName() {
        return agentCompanyName;
    }

    /**
     * @param agentCompanyName the agentCompanyName to set
     */
    public void setAgentCompanyName(String agentCompanyName) {
        this.agentCompanyName = agentCompanyName;
    }

    /**
     * @return the agentLocation
     */
    public String getAgentLocation() {
        return agentLocation;
    }

    /**
     * @param agentLocation the agentLocation to set
     */
    public void setAgentLocation(String agentLocation) {
        this.agentLocation = agentLocation;
    }

    /**
     * @return the agentAmountPaid
     */
    public String getAgentAmountPaid() {
        return agentAmountPaid;
    }

    /**
     * @param agentAmountPaid the agentAmountPaid to set
     */
    public void setAgentAmountPaid(String agentAmountPaid) {
        this.agentAmountPaid = agentAmountPaid;
    }

    /**
     * @return the agentAmountOwed
     */
    public String getAgentAmountOwed() {
        return agentAmountOwed;
    }

    /**
     * @param agentAmountOwed the agentAmountOwed to set
     */
    public void setAgentAmountOwed(String agentAmountOwed) {
        this.agentAmountOwed = agentAmountOwed;
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
