
const initialize = () => {
  
  const connectBtn = document.getElementById('connectButton');

  
  const isMetaMaskInstalled = () => {
    
    const { ethereum } = window;
    return Boolean(ethereum && ethereum.isMetaMask);
  };

  const onClickConnect = async () => {
  try {
   
    await ethereum.request({ method: 'eth_requestAccounts' });
  } catch (error) {
    console.error(error);
  }
};

  const MetaMaskClientCheck = () => {
   
    if (!isMetaMaskInstalled()) {
      
      connectBtn.innerText = 'Click here to install MetaMask!';
      connectBtn.disabled = true;
    } else {
      
      connectBtn.innerText = 'metamask collect';
      connectBtn.onclick = onClickConnect;
      connectBtn.disabled = false;
    }
  };
  MetaMaskClientCheck();
}
if (typeof window.ethereum !== 'undefined') {
  document.write('MetaMask is installed!');
} else {
  document.write('MetaMask is not installed!');
}
window.addEventListener('DOMContentLoaded', initialize);