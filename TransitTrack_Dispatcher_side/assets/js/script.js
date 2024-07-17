document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    // Perform login logic here
    alert(`Username: ${username}\nPassword: ${password}`);
});
