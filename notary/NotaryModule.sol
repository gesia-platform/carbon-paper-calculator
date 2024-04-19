// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

import "./NotaryPublic.sol";

abstract contract NotaryModule {
    NotaryPublic public immutable notaryPublic;

    constructor(NotaryPublic _notaryPublic) {
        notaryPublic = _notaryPublic;
    }

    modifier onlyNotaryAccount(uint256 appID) {
        (bool exists, uint256 ownedAppID) = notaryPublic
            .getAppIDByNotaryAccount(msg.sender);

        if (!exists) {
            revert("unauthroized account call");
        } else if (appID != 0 && ownedAppID != appID) {
            revert("unauthroized");
        }
        _;
    }
}
