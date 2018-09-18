@isTest
public class TestDataFactory {
	 
    public static List <Job_Application__c> createJobApplications(Integer count){
        List <Job_Application__c> jobApplications = new List <Job_Application__c>();
        List <Candidate__c> candidates = createCandidates(count);
        List <Position__c> positions = createPositions(count);
        
        for(integer i = 0; i < count; i++){
            jobApplications.add( 
                new Job_Application__c( Position__c = positions[i].Id, Candidate__c = candidates[i].Id )
            );
        }
        insert jobApplications;
        return jobApplications;
    }
    public static List <Candidate__c> createCandidates(Integer count){
        List <Candidate__c> candidates = new List <Candidate__c>();
        for(integer i = 0; i < count; i++){
            candidates.add(
                new Candidate__c( First_Name__c = 'FirstName'+i, Last_Name__c = 'FirstName'+i )
            );
        }
        insert candidates;
        return candidates;
    }
    public static List <Position__c> createPositions(Integer count){
        List <Position__c> positions = new List <Position__c>();
        for(integer i = 0; i < count; i++){
            positions.add(
                new Position__c( Name = 'Title'+i )
            );
        }
        insert positions;        
        return positions;
    }
   
    public static List <Position__c> createUnclaimedPositions(Integer count){
        List <Position__c> unclaimedPositions = new List <Position__c>();        
        for(integer i = 0; i < count; i++){
            unclaimedPositions.add( 
                // Owner is an Admin (current user)
                new Position__c( Name = 'unclaimedPositionTest '+ i )
            );
        }
        insert unclaimedPositions;        
        return unclaimedPositions;
    }
    public static List <Position__c> createPositionsWithRecruiterOwner(Integer count){
        List <Position__c> createdPositions = new List <Position__c>();
        
        ID id = ReassignUnclaimedPositionToQueueService.getRecrutersIds()[0];
        for(integer i = 0; i < count; i++){
            createdPositions.add( 
                new Position__c( Name = 'createdByRecruiter '+ i , OwnerId = id)
            );
        }
        insert createdPositions;        
        return createdPositions;
    }
    
    
}