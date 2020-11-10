/**
 * Created by BRITENET on 09.11.2020.
 */

public with sharing class AS_ChatCaseManagement {

    public class ChatBotOutput {
        @InvocableVariable(required= true)
        public String status;
    }

    public class ChatBotInput {
        @InvocableVariable(required= true)
        public String caseNumber;
    }


    @InvocableMethod(Label ='Validate case number' description='Check if case number is valid')
    public static List<ChatBotOutput> checkCaseNumber(List<ChatBotInput> inputList) {                                ///////////////111111
        List<ChatBotOutput> outputList = new List<ChatBotOutput>();
        List<String> userInput = getCaseNumberList(inputList);
        String caseStatusFromQuery = getCaseStatuses(userInput);
        ChatBotOutput messageToChat = getOutputElement(caseStatusFromQuery);
        outputList.add(messageToChat);
        return outputList;
    }

    private static ChatBotOutput getOutputElement(String caseStatus) {
        ChatBotOutput outputElement = new ChatBotOutput();
        if(String.isBlank(caseStatus)){
            outputElement.status =
        }else{
            outputElement.status = caseStatus;
        }
        return outputElement;
    }

    private static String getCaseStatuses(List<String> caseNumberList) {
        List<Case> cases = new List<Case>();
        cases = [
                SELECT Status
                FROM Case
                WHERE CaseNumber IN :caseNumberList
                LIMIT 1
        ];

        String caseInfo = 'Information about your case: '
        if(cases.isEmpty()){
            return null;
        }else{
            caseInfo =
        }
        return cases.isEmpty() ? null : cases[0].Status;
    }

    private static List<String> getCaseNumberList(List<ChatBotInput> inputList) {
        List<String> caseNumberList = new List<String>();
        for (ChatBotInput inputElement : inputList) {
            if (String.isNotBlank(inputElement.caseNumber)) {
                caseNumberList.add(inputElement.caseNumber);
            }
        }
        return caseNumberList;
    }
}