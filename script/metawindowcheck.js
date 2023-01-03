const ethereumProvider = () => {

      if (!ethereumProvider) {
        Modal.confirm({
          centered: true,
          title: "Please install metamask app",
          async onOk() {
            <button onclick="window.open('https://metamask.io/download/')">text</button>
          }//기존 윈도우에 메타마스크 확장 프로그램이 깔려잇는지 확인
        })
      } else {
        location.href="https://metamask.io/"}
      }
        ethereumProvider();