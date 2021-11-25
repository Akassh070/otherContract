pragma solidity ^0.8.1;

contract EventOrgnize{
    address manager;
    struct Event{
        address admin;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }
    constructor(){
        manager=msg.sender;
    }
    modifier onlyManager{
        require(msg.sender==manager,"The Only Manager Can Create The Event");
        _;
    }
    mapping(uint=>Event)public Events;
    uint EventCount;
    mapping(address=>mapping(uint=>uint))public tickets;
    function createEvent(address _admin,string memory _name,uint _date,uint _price,uint _ticketCount,uint _ticketRemain)public onlyManager{
        Event memory e = Events[EventCount];
        e.admin=_admin;
        e.name=_name;
        e.date=_date;
        e.price=_price;
        e.ticketCount=_ticketCount;
        e.ticketRemain=_ticketRemain;
        EventCount++;

    }
    function buyTicket(uint id,uint _noOfTickets)public{
        tickets[msg.sender][id]+=_noOfTickets;
        Events[id].ticketCount=Events[id].ticketCount-_noOfTickets;
    }
}


function random()public returns(){

}