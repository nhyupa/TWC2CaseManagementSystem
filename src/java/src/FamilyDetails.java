/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class FamilyDetails {
    private String familyMemberName;
    private String familyMemberRelationship;
    private String familyMemberPhoneNumber;
    private String familyMemberObsolete;
    
    
    public FamilyDetails(String familyMemberName, String familyMemberRelationship, String familyMemberPhoneNumber, String familyMemberObsolete){
        this.familyMemberName = familyMemberName;
        this.familyMemberRelationship = familyMemberRelationship;
        this.familyMemberPhoneNumber = familyMemberPhoneNumber;
        this.familyMemberObsolete = familyMemberObsolete;
        
        
    }

    /**
     * @return the familyMemberName
     */
    public String getFamilyMemberName() {
        return familyMemberName;
    }

    /**
     * @param familyMemberName the familyMemberName to set
     */
    public void setFamilyMemberName(String familyMemberName) {
        this.familyMemberName = familyMemberName;
    }

    /**
     * @return the familyMemberRelationship
     */
    public String getFamilyMemberRelationship() {
        return familyMemberRelationship;
    }

    /**
     * @param familyMemberRelationship the familyMemberRelationship to set
     */
    public void setFamilyMemberRelationship(String familyMemberRelationship) {
        this.familyMemberRelationship = familyMemberRelationship;
    }

    /**
     * @return the familyMemberPhoneNumber
     */
    public String getFamilyMemberPhoneNumber() {
        return familyMemberPhoneNumber;
    }

    /**
     * @param familyMemberPhoneNumber the familyMemberPhoneNumber to set
     */
    public void setFamilyMemberPhoneNumber(String familyMemberPhoneNumber) {
        this.familyMemberPhoneNumber = familyMemberPhoneNumber;
    }

    /**
     * @return the familyMemberObsolete
     */
    public String getFamilyMemberObsolete() {
        return familyMemberObsolete;
    }

    /**
     * @param familyMemberObsolete the familyMemberObsolete to set
     */
    public void setFamilyMemberObsolete(String familyMemberObsolete) {
        this.familyMemberObsolete = familyMemberObsolete;
    }
}
