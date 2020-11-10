/**
 * Created by BRITENET on 09.11.2020.
 */

public with sharing class AS_ChatJokesGenerator {

    public class ChatBotOutput {
        @InvocableVariable(required= true)
        public String joke;
    }

//    public class ChatBotInput {
//        @InvocableVariable(required= true)
//        public String caseNumber;
//    }


    @InvocableMethod(Label ='generate a joke' description='')
    public static List<ChatBotOutput> generateJoke() {
        List<ChatBotOutput> outputList = new List<ChatBotOutput>();
        outputList.add(getOutputElement('Co mówi Zenek gdy spóźni się na szkolenie ? Kto wam kazał przyjść tak wcześnie.'));
        return outputList;
    }

    private static ChatBotOutput getOutputElement(String joke) {
        ChatBotOutput outputElement = new ChatBotOutput();
        outputElement.joke = joke;
        return outputElement;
    }


    private void jokes() {
        String joke1 = 'Co mówi Zenek gdy spóźni się na szkolenie ? Kto wam kazał przyjść tak wcześnie.';
        String joke2 = '';
        String joke3 = '';
        String joke4 = '';
        String joke5 = '';
    }

}