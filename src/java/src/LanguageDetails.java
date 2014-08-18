/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class LanguageDetails {
    private String workerMainLanguage;
    private String spokenEnglishStandard;
    private String languageRemarks;
    
    public LanguageDetails(String workerMainLanguage, String spokenEnglishStandard, String languageRemarks){
        this.workerMainLanguage = workerMainLanguage;
        this.spokenEnglishStandard = spokenEnglishStandard;
        this.languageRemarks = languageRemarks;
    }

    /**
     * @return the workerMainLanguage
     */
    public String getWorkerMainLanguage() {
        return workerMainLanguage;
    }

    /**
     * @param workerMainLanguage the workerMainLanguage to set
     */
    public void setWorkerMainLanguage(String workerMainLanguage) {
        this.workerMainLanguage = workerMainLanguage;
    }

    /**
     * @return the spokenEnglishStandard
     */
    public String getSpokenEnglishStandard() {
        return spokenEnglishStandard;
    }

    /**
     * @param spokenEnglishStandard the spokenEnglishStandard to set
     */
    public void setSpokenEnglishStandard(String spokenEnglishStandard) {
        this.spokenEnglishStandard = spokenEnglishStandard;
    }

    /**
     * @return the languageRemarks
     */
    public String getLanguageRemarks() {
        return languageRemarks;
    }

    /**
     * @param languageRemarks the languageRemarks to set
     */
    public void setLanguageRemarks(String languageRemarks) {
        this.languageRemarks = languageRemarks;
    }
}
