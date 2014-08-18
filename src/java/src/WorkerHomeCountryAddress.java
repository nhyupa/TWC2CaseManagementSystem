/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerHomeCountryAddress {
    private String homeCountryAddress;
    private String homeCountryAddrObsolete;
    private String FIN_Number;
    
    public WorkerHomeCountryAddress(String homeCountryAddress, String homeCountryAddrObsolete, String FIN_Number){
        this.homeCountryAddress = homeCountryAddress;
        this.homeCountryAddrObsolete = homeCountryAddrObsolete;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the homeCountryAddress
     */
    public String getHomeCountryAddress() {
        return homeCountryAddress;
    }

    /**
     * @param homeCountryAddress the homeCountryAddress to set
     */
    public void setHomeCountryAddress(String homeCountryAddress) {
        this.homeCountryAddress = homeCountryAddress;
    }

    /**
     * @return the homeCountryAddrObsolete
     */
    public String getHomeCountryAddrObsolete() {
        return homeCountryAddrObsolete;
    }

    /**
     * @param homeCountryAddrObsolete the homeCountryAddrObsolete to set
     */
    public void setHomeCountryAddrObsolete(String homeCountryAddrObsolete) {
        this.homeCountryAddrObsolete = homeCountryAddrObsolete;
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
