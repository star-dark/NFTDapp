if (typeof window.ethereum !== 'undefined') {
    console.log('MetaMask is installed!');
  }
  ethereum.request({ method: 'eth_requestAccounts' });
  <button class="enableEthereumButton">Enable Ethereum</button>
  const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
const account = accounts[0];
// We currently only ever provide a single account,
// but the array gives us some room to grow.
