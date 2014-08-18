/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerPhoto {
    
    
    private String photoName;
    private String dateStamp;
    private String FIN_Number;
    
    
    public WorkerPhoto(String photoName, String dateStamp,String FIN_Number){
        this.photoName = photoName;
        this.dateStamp = dateStamp;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the photoName
     */
    public String getPhotoName() {
        return photoName;
    }

    /**
     * @param photoName the photoName to set
     */
    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    /**
     * @return the dateStamp
     */
    public String getDateStamp() {
        return dateStamp;
    }

    /**
     * @param dateStamp the dateStamp to set
     */
    public void setDateStamp(String dateStamp) {
        this.dateStamp = dateStamp;
    }
}
