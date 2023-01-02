import Web3 from 'web3'

return new Promise((resolve, reject) => {
 
  window.addEventListener('load', async () => {
    let web3, account;
   
    if (window.ethereum) {
      web3 = new Web3(window.ethereum);
   
    } else if (typeof window.web3 !== 'undefined') {
      web3 = new Web3(window.web3.currentProvider);
    } else {
      
      reject(new Error('No web3 instance injected, using local web3.'))
    }
    if (web3) {
      
      account = await web3.eth.requestAccounts();
    }
  })
})