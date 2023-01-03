const initialize = () => {
  //Basic Actions Section
  const connectBtn = document.getElementById('connectButton');

  //Created check function to see if the MetaMask extension is installed
  const isMetaMaskInstalled = () => {
    //Have to check the ethereum binding on the window object to see if it's installed
    const { ethereum } = window;
    return Boolean(ethereum && ethereum.isMetaMask);
  };

  const onClickConnect = async () => {
  try {
    // Will open the MetaMask UI
    // You should disable this button while the request is pending!
    await ethereum.request({ method: 'eth_requestAccounts' });
  } catch (error) {
    console.error(error);
  }
};

  const MetaMaskClientCheck = () => {
    //Now we check to see if MetaMask is installed
    if (!isMetaMaskInstalled()) {
      //If it isn't installed we ask the user to click to install it
      connectBtn.innerText = 'Click here to install MetaMask!';
      connectBtn.disabled = true;
    } else {
      //If it is installed we change our button text
      connectBtn.innerText = 'Connect';
      onboardButton.onclick = onClickConnect;
      onboardButton.disabled = false;
    }
  };
  MetaMaskClientCheck();
}
window.addEventListener('DOMContentLoaded', initialize);