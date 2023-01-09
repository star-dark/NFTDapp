async function connectWallet() {
  accounts = await window.ethereum.request({method: "eth_requestAccount"}).catch
    //에러 확인
    console.log(err.code)

}

console.log(accounts)

async function checkBalance() {
  let balance = await window.ethereum.request({method: "eth_getBalance",
    params: [
      accounts[0],
      'latest'
    ]
}).catch((err)=>{
    console.log(err)
})

console.log(parseInt(balance))
  }

 