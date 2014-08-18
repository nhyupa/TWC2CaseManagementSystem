/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
import java.text.SimpleDateFormat;
import java.util.*;

public class DBConnectTest {
    public static void main (String[] args){
        String NRIC_No = "G0909493N";
        String employerName = "Yupa Nyein Htoon";
        String workPassType = "Work Permit";
        String workPassMore = "";
        String jobSector = "construction";
        String jobSectorMore = "";
        String occupation = "Site Worker";
        String startDate = "Last Year";
        String endDate = "This Year July";
        String jobWhetherTJS = "N";
        String jobRemarks = "nhyupa.2010@sis.smu.edu.sg";
       
        
        String passportCountry = "Myanmar";
        String passportNum = "M904045";
        String passportIssueDate = "2014-03-05";
        String passportExpiryDate = "2018-03-05";
        DBConnect.connectDB();
        //JobProfile job = new JobProfile(NRIC_No,employerName, workPassType, workPassMore, jobSector,  jobSectorMore, occupation,  startDate, endDate, jobWhetherTJS, jobRemarks);
        //DBConnect.createJob(job);
        //DBConnect.insertPassportDetails(passportCountry, passportNum, NRIC_No, passportIssueDate, passportExpiryDate);
        //ArrayList<WorkerSGContactDetails> contactDetails = DBConnect.retrieveWorkerContactDetails("G0909492N");
        //System.out.println(contactDetails.size());
        //DBConnect.insertHomeCountryAddress("Clementi Avenue 5", "2014-08-30", "G0909493N");
        //DBConnect.insertKinDetails("Htoon", "Mother", "90439566", "2080-01-12", "G0909493N");
        //DBConnect.insertPassDetails("Work Permit", "123455", "2013-07-14", "G0909493N");
        //ArrayList<Pass> pass = DBConnect.getPassDetails("G0909492N");
        //System.out.println(pass.size());
        
        //DBConnect.insertIPADetails("Employment Pass", "Samuel", "3500", 400.00, "G0909493N");
        //ArrayList<IPA> ipaDetail = DBConnect.getIPADetails("G0909492N");
        //System.out.println(ipaDetail.size());
        //DBConnect.insertVerbalAssuranceDetails("yupa", "friend","last 3 or 4 years ago", "cannot remember", "G0909493N");
        //DBConnect.insertEmploymentContractDetails("2014-08-07", "Singapore", "", "3000", "G0909493N");
        //DBConnect.insertEmployerDetails("Laurent", "One North", "90499566", "CEO", "G0909493N");
        //DBConnect.insertWorkplaceDetails("dangerous", "Boss", "supervisor", "last year", "G0909493N");
        //ArrayList<Workplace> workplace  = DBConnect.getWorkplaceDetails("G0909492N");
       // System.out.println(workplace.size());
        //DBConnect.insertWorkHistoryDetails("From Friend", "2013-01-01", "N", "2012-01-01", "G0909493N");
       // ArrayList<WorkHistory> workhistoryDetails = DBConnect.getWorkHistoryDetails("G0909492N");
       // System.out.println(workhistoryDetails.size());
       //Double monthlyCost = 1500.00;
       //DBConnect.insertAccomodationDetails("Yes", "Terrance","1500" , "500", "G0909493N");
       //ArrayList<Accomodation> accomodationDetail = DBConnect.getAccomodationDetails("G0909493N");
       //System.out.println(accomodationDetail.size());
       // DBConnect.insertAggravatingIssueDetails("Other", "Unpaid", "500", "Something somethign", "G0909493N");
        //DBConnect.insertAuxillaryCaseWorkerDetails("Sion", "2014-07-07", "2014-08-08", "G0909493N");
        //DBConnect.insertBasicSalaryComplaintDetails("Boss does not give me salary", "Monthly", "1700", "3400", "G0909493N");
       //DBConnect.insertInjuryDetails("2014-08-10", "Bukit Temah", "Yes", "Mount Elizabeth", "G0909493N");
    
        //DBConnect.insertIllnessDetails("2014-08-07", "TB", "Bad", "Yes", "G0909493N");
        //ChiefProblem problem = new ChiefProblem("2014-08-08","test","Other problem","test remakrs","G0909493N");
        //DBConnect.createProblem(problem);
        //DBConnect.updateProblemRegistrationDate("G0909493N", "2020-08-09");
        //DBConnect.updateChiefProblem("G0909493N","Edited Record");
        //DBConnect.updateChiefProblemMore("G0909493N", "More problem");
        //DBConnect.updateChiefProblemRemarks("G0909493N", "Remarks");
        //DBConnect.insertTraffickingIndicatorsDetails("2014-08-12", "Alex", "Other indicators complaint", "other indicators complaint", "G0909498N");
        //ArrayList<String> problems = DBConnect.retrieveJobKeyFromProblem("G0909493N");
        //System.out.println(problems.size());
        //DBConnect.insertSalaryClaimLodgedDetails("2014-08-12", "1000", "Monthly", "G0909493N");
       // DBConnect.insertMCDetails("2014-08-12", "30days", "2014-09-12", "40", "G0909495N");
       // DBConnect.insertTtrDetails("2014-08-11", "Yes", "lastYear", "yupa", "G0909498N");
        
        //DBConnect.insertPoliceReportDetails("2014-08-13", "Ang Mo Kio", "Pat", "test", "G0909498N");
        //DBConnect.insertBenefitDetails("2014-12-08", "Somethign", "somethign", "10000", "G0909498N");
        //DBConnect.insertMilestoneNonCriminalDetails("2014-08-08", "yes", "no", "1000", "G0909498N");
    }
    
}
