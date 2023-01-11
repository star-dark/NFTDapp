const initialize = () => {
  //Basic Actions Section
  const connectBtn = document.getElementById('connectButton');
  const getAccountBtn = document.getElementById('getWalletAddress');
  const putAccount = document.getElementById('addressInput');
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
    connectBtn.disabled = true;
    connectBtn.innerText = "연결되었습니다.";
  } catch (error) {
    console.error(error);
  }
};
  const getAccount = async () =>{
    try {
      const accounts = await ethereum.request({ method: 'eth_accounts'});
      putAccount.value = accounts[0];
      getAccountBtn.disabled = true;
    }
    catch(error){
      console.error(error);
    }
  }
  const MetaMaskClientCheck = () => {
    //Now we check to see if MetaMask is installed
    if (!isMetaMaskInstalled()) {
      //If it isn't installed we ask the user to click to install it
      connectBtn.innerText = 'Click here to install MetaMask!';
      connectBtn.disabled = true;
    } else {
      //If it is installed we change our button text
      connectBtn.innerText = '메타마스크 지갑연동하기';
      connectBtn.onclick = onClickConnect;
      connectBtn.disabled = false;
    }

    
  };
  MetaMaskClientCheck();
  getAccountBtn.addEventListener("click",getAccount);
}
window.addEventListener('DOMContentLoaded', initialize);