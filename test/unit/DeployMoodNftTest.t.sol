// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory svg =
            '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x ="0" y ="15" fill="black"> hi! You decoded this! </text></svg>';
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4ID0iMCIgeSA9IjE1IiBmaWxsPSJibGFjayI+IGhpISBZb3UgZGVjb2RlZCB0aGlzISA8L3RleHQ+PC9zdmc+";
        string memory actualUri = deployer.svgToImageURI(svg);
        console.log("Expected URI:", expectedUri);
        console.log("Actual URI:", actualUri);

        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}
/* "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4ID0iMCIgeSA9IjE1IiBmaWxsPSJibGFjayI+IGhpISBZb3UgZGVjb2RlZCB0aGlzISA8L3RleHQ+PC9zdmc+";*/
