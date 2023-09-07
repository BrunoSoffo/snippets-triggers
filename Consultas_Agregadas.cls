// Triggers
// Cenário: Sumarização de dados
// Consultas agregadas no Apex



public with sharing class Example {
    public Example() {}

    public static void execute(){
        //query
        List<Account> accountList = [
            SELECT Id, Name
            FROM Account
        ];

        for (Account account : accountList){
            String accountName = account.Name;
        }

        // aggregated query
        // aggregateResult = Lista de uma classe do Apex
        List<aggregatedResult> resultList = [
            SELECT AccountId, Status, SUM(TotalAmount) TotalValue
            FROM Order
            GROUP BY AccountId, Status
        ]; //A notação Alias é uma forma de referenciar chamadas com parâmetros mais fáceis, por exemplo o TotalValue

        for (AggregateResult result :resultList){
            Id accountId = (Id)result.get('AccountId');
            String status = (String)result.get('Status');

            Decimal totalAmount = (Decimal)result.get('TotalValue');
        }


    }
}
