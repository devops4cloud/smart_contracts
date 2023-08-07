import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";

contract ArcadeToken is ERC20, ERC20Detailed {

	address payable owner;

	constructor(uint initial_supply) ERC20Detailed("ArcadeToken", "ARCD", 18) public {
    	    owner = msg.sender;
    	    _mint(owner, initial_supply);
	}

    modifier onlyOwner {
    require(msg.sender == owner, "You do not have permission to mint these tokens!");
    _;
    }
    function mint(address recipient, uint amount) public onlyOwner {
    _mint(recipient, amount);
    }
}

