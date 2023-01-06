const makeItemForm = document.querySelector(".form");
makeItemForm.addEventListener('submit', event =>{
    event.preventDefault();
    const formdata = new FormData(makeItemForm);
    const data = new URLSearchParams(formdata);
    fetch('https://reqres.in/api/users',{
        method : 'POST',
        body : data
    }).then(res => res.json())
    .then(JSON.stringify(res))
    .catch(error => console.error());
});