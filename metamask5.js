


<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js/dist/web3.min.js"></script>

 console.log(web3);

if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
    alert('web3가 주입되었습니다.');

} else { web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

let userAccount;    // 사용자가 사용 중 이라고 브라우저가 인식하는 계정

let checkAccountChange = setInterval(async function() {
        // 계정이 바뀌었는지 확인
        let currentAccount = await web3.eth.getAccounts().then(function(array) { return array[0] });
        // 현재 유저가 들고있는 계정(currentAccount)가 브라우저가 인식하는 계정(userAccount)와 다르다면
        if (currentAccount !== userAccount) {
            // 계정을 업데이트 해준다
            userAccount = currentAccount;
            // 새 계정에 대한 UI로 업데이트하기 위한 함수 호출 및 메시지 알림
            alert('Your account is ' + userAccount);
        }
    }, 1000); 