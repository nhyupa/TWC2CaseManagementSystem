/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerSgAddress {
    private  String singaporeAddress;
    private String singaporeAddrObsoleteDate;
    private String FIN_Num;
    
    public WorkerSgAddress(String singaporeAddress, String singaporeAddrObsoleteDate, String FIN_Num){
        this.singaporeAddress = singaporeAddress;
        this.singaporeAddrObsoleteDate = singaporeAddrObsoleteDate;
        this.FIN_Num = FIN_Num;
    }

    /**
     * @return the singaporeAddress
     */
    public String getSingaporeAddress() {
        return singaporeAddress;
    }

    /**
     * @param singaporeAddress the singaporeAddress to set
     */
    public void setSingaporeAddress(String singaporeAddress) {
        this.singaporeAddress = singaporeAddress;
    }

    /**
     * @return the singaporeAddrObsoleteDate
     */
    public String getSingaporeAddrObsoleteDate() {
        return singaporeAddrObsoleteDate;
    }

    /**
     * @param singaporeAddrObsoleteDate the singaporeAddrObsoleteDate to set
     */
    public void setSingaporeAddrObsoleteDate(String singaporeAddrObsoleteDate) {
        this.singaporeAddrObsoleteDate = singaporeAddrObsoleteDate;
    }

    /**
     * @return the FIN_Num
     */
    public String getFIN_Num() {
        return FIN_Num;
    }

    /**
     * @param FIN_Num the FIN_Num to set
     */
    public void setFIN_Num(String FIN_Num) {
        this.FIN_Num = FIN_Num;
    }
}
