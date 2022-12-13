const hre = require("hardhat");

async function main() {
  const RealState = await hre.ethers.getContractFactory("RealEstate");
  const realState = await RealState.deploy();

  await realState.deployed();

  console.log(`deployed to ${RealState.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
