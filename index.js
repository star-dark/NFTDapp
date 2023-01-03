import detectEthereumProvider from '@metamask/detect-provider'
const provider = await detectEthereumProvider();
if (provider) {
  // From now on, this should always be true:
  // provider === window.ethereum   
  startApp(provider); // initialize your app
} else {
  console.log('Please install MetaMask!');
}
const ethereumButton = document.getElementById('connectButton');
ethereumButton.addEventListener('click', () => {
  //Will Start the metamask extension
  ethereum.request({ method: 'eth_requestAccounts' });
});