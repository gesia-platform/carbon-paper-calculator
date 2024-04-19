// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

import "./NotaryAccount.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NotaryPublic is Ownable {
    mapping(address => bool) internal memberships;

    mapping(address => uint256) internal appIDByNotaryAccount;
    mapping(uint256 => address) internal notaryAccountByAppID;

    mapping(bytes1 prefix => mapping(uint256 appID => mapping(address notary => bytes signature)))
        internal notarizations;

    mapping(address notary => bytes pubkey) internal pubkeys;

    event Notarized(
        bytes1 prefix,
        uint256 appID,
        bytes signatrue,
        address notary
    );

    event NotaryAccountCreated(uint256 appID, address notaryAccount);

    modifier onlyMembership() {
        require(hasMembership(msg.sender), "sender has no membership");
        _;
    }

    function createNotaryAccount(uint256 appID) external onlyMembership {
        address account = address(new NotaryAccount(this));
        appIDByNotaryAccount[account] = appID;
        notaryAccountByAppID[appID] = account;

        emit NotaryAccountCreated(appID, account);
    }

    function notarize(
        bytes1 prefix,
        uint256 appID,
        bytes memory signatrue
    ) external onlyMembership {
        notarizations[prefix][appID][msg.sender] = signatrue;

        emit Notarized(prefix, appID, signatrue, msg.sender);
    }

    function register(bytes memory pubkey) external onlyMembership {
        pubkeys[msg.sender] = pubkey;
    }

    function setMembership(
        address account,
        bool membership
    ) external onlyOwner {
        memberships[account] = membership;
    }

    function getPubkey(address notary) public view returns (bytes memory) {
        return pubkeys[notary];
    }

    function hasMembership(address account) public view returns (bool) {
        return memberships[account];
    }

    function getNotarization(
        bytes1 prefix,
        uint256 appID,
        address notary
    ) public view returns (bytes memory, bytes memory) {
        return (pubkeys[notary], notarizations[prefix][appID][notary]);
    }

    function getAppIDByNotaryAccount(
        address account
    ) public view returns (bool, uint256) {
        uint256 appID = appIDByNotaryAccount[account];
        return (appID != 0, appID);
    }

    function getNotaryAccount(
        uint256 appID
    ) public view returns (bool, address) {
        address account = notaryAccountByAppID[appID];
        return (address(0) != account, account);
    }
}
