pragma solidity ^0.4.17;

contract Owner{
    address operator;
    
    function Owner() public{
        operator = msg.sender; 
    }
    modifier onlyOwner{
        require(msg.sender == operator);
        _;
    }
    
}



contract HospitalRecordManagement is Owner{
    
    struct Record{
        string fName;
        string lName;
        uint age;
        string disease;
        string medicine;
        
    }
    mapping (address => Record) records;      //based on the address we can find any particular record value 
    
    Record[] public recordArray;                //Defining an array of record
    
    event Display(
        string fName,
        string lName,
        uint age,
        string disease,
        string medicine
        );
    
    
    function setValue(string _fName, string _lName, uint _age, string _disease, string _medicine) onlyOwner public returns(uint)  //Only the operator can push data
    {
        recordArray.length++;
        recordArray[recordArray.length-1].fName = _fName;
        recordArray[recordArray.length-1].lName =_lName;
        recordArray[recordArray.length-1].age =_age;
        recordArray[recordArray.length-1].disease =_disease;
        recordArray[recordArray.length-1].medicine =_medicine;
        return recordArray.length;
        
        Display(_fName,_lName,_age,_disease,_medicine);
    }
    
    
    function compareStrings (string a, string b) view public returns (bool){
       return keccak256(a) == keccak256(b);
   }
    
    function getValue(string _fName) view public returns(string,string,uint,string,string){
        
        for(uint i=0;i<recordArray.length;i++)
        {
            if(!compareStrings(recordArray[i].fName, _fName))
            {
                continue;
            }
            else
            {
                return (recordArray[i].fName, recordArray[i].lName, recordArray[i].age, recordArray[i].disease, recordArray[i].medicine);
            }
        }
    
        
    }
   
    
    function getRecordCount() public constant returns(uint) {
        return recordArray.length;
    }
    
  
}
