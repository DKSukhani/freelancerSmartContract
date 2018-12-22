pragma solidity 0.5.0;
pragma experimental ABIEncoderV2;


contract Freelancer {
    // this is like creating a class with the name "FreelancerData"
    // we can call this class later on and create an object for a particular "freelancer"
    
    struct FreelancerData {
       bytes32 firstName;
       bytes32 lastName;
       uint256 coins;
       uint256 cash;
       bytes32 service; 
    }
    // this struct will be called to store data for every new freelancer
    
    address public owner;
    uint256 private coins;
    uint256 private cash;
    bytes32 private service;
    
    mapping (address => FreelancerData) FreelancersData;
    // this mapping will map all the address of the freelancers to the freelancers database
    
    // external —can’ t be accessed internally, only externally (saves around 50% gas compared to public).
    // public —everyone can access.
    // internal —only this contract and contracts deriving from it can access.
    // private —can be accessed only from this contract.
    
    // to log data when some things change, we use the keywork event
    // an event can have 3 items that are indexed
    // to use an event we have to use the key word "emit"
    // eg "emit[event_name(parameters)"]
    
    constructor() public{
        owner = msg.sender;
        coins = 0;
        cash = 0;
        service = "";
    }
    
    event logFreelancerChanged (
        address indexed owner,
        bytes32 firstName,
        bytes32 lastName,
        uint256 coins,
        uint256 cash,
        bytes32 service
    );
    
    event logAssetsChanged(
        address indexed owner,
        uint256 coins,
        uint256 cash,
        bytes32 service
    );
    
    modifier onlyFreelancer() {
        require(owner == msg.sender, "Sender not authorised.");
        _;
    }
        
    function setFreelancer(bytes32 _firstName, bytes32 _lastName, uint256 _coins, uint256 _cash, bytes32 _service) public onlyFreelancer returns (FreelancerData) {
        FreelancerData memory newFreelancer = FreelancerData ({
            firstName: _firstName,
            lastName: _lastName,
            coins: _coins,
            cash: _cash,
            service: _service
        });
    }
    
    
    function myAccount() public view onlyFreelancer returns(uint, uint) {
        
    }
    
    
}
