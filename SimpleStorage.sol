//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SimpleStorage {

    struct BioDetails {
        string name;
        uint256 age;
        string dob;
        string place;
    }

    /* The below 2 lines will used only 1 sender store 1 data.
    BioDetails[] public bioDetails;
    mapping(address => BioDetails) public bioDetailsMapping;
    */

    mapping(address => BioDetails[]) bioDetailsMapping; // now single user store multiple value

    function setBioDetails(string memory _name, uint256 _age, string memory _dob, string memory _place) public {
        BioDetails memory newDetails = BioDetails(_name, _age, _dob, _place);
        /* The below 2 lines will used only 1 sender store 1 data.
        bioDetails.push(newDetails);
        bioDetailsMapping[msg.sender] = newDetails;
        */

        bioDetailsMapping[msg.sender].push(newDetails);
    }

    function getBioDetails(address _address, uint256 _index) public view returns(BioDetails memory) {
        //return bioDetailsMapping[_address]; The below 2 lines will used only 1 sender store 1 data.
        return bioDetailsMapping[_address][_index];
    }
}
