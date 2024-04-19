// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "./notary/NotaryPublic.sol";

contract CarbonEmissions is ERC1155, ERC1155Holder {
    string private name;

    mapping(address => bool) private _calculatorApprovals;

    address public immutable notaryPublic;

    event CarbonEmitted(uint256 applicationID, uint256 emissions, bytes userID);

    modifier onlyApprovalCalculator() {
        require(
            _calculatorApprovals[msg.sender],
            "sender is not approved calculator"
        );
        _;
    }

    /**
     * @param _name The emissions categroy name.
     */

    constructor(string memory _name, address _notaryPublic) ERC1155("") {
        name = _name;
        notaryPublic = _notaryPublic;
    }

    function mint(
        uint256 applicationID,
        uint256 emissions, // scaled by 10,000
        bytes memory userID
    ) external onlyApprovalCalculator {
        super._mint(address(this), applicationID, emissions, "");

        emit CarbonEmitted(applicationID, emissions, userID);
    }

    function setCalculatorApproval(address calculator, bool approval) external {
        require(
            NotaryPublic(notaryPublic).hasMembership(msg.sender),
            "sender is not notary member"
        );

        _calculatorApprovals[calculator] = approval;
    }

    function isApprovedCalculator(
        address calculator
    ) public view returns (bool) {
        return _calculatorApprovals[calculator];
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155, ERC1155Receiver) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
