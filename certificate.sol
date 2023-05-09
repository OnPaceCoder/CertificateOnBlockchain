// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Certificate {
    struct UserInfo {
        string Name;
        uint256 Enrollment;
        string Subject;
        uint256 dateOfIssue;
    }

    address public ContractOwnerAdmin;
    uint256 internal CertificateId;

    mapping(uint256 => UserInfo) UserData;

    constructor() {
        ContractOwnerAdmin = msg.sender;
    }

    function WhoIsAdmin() public view returns (address) {
        require(msg.sender == ContractOwnerAdmin, "You are not admin");
        return ContractOwnerAdmin;
    }

    function setDate(
        uint256 _CertificateId,
        string memory _name,
        uint256 _enroll,
        string memory _subject
    ) public returns (bool success) {
        require(msg.sender == ContractOwnerAdmin, "You are not admin");

        CertificateId = _CertificateId;

        UserData[_CertificateId].Name = _name;
        UserData[_CertificateId].Enrollment = _enroll;
        UserData[_CertificateId].Subject = _subject;
        UserData[_CertificateId].dateOfIssue = block.timestamp;

        return true;
    }

    function getData(uint256 _CertificateId)
        public
        view
        returns (UserInfo memory)
    {
        return UserData[_CertificateId];
    }
}
