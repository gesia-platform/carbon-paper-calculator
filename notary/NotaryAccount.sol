// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

import "./NotaryPublic.sol";

contract NotaryAccount {
    NotaryPublic public immutable notaryPublic;

    constructor(NotaryPublic _notaryPublic) {
        notaryPublic = _notaryPublic;
    }

    function notaryCall(address target, bytes memory data) external {
        require(
            notaryPublic.hasMembership(msg.sender),
            "sender is not notary public member"
        );

        (bool success, bytes memory result) = target.call(data);
        if (!success) {
            assembly {
                revert(add(result, 32), mload(result))
            }
        }
    }
}
