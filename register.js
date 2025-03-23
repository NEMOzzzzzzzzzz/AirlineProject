document.getElementById('registrationForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Get form values
    const firstName = document.getElementById('firstName').value;
    const lastName = document.getElementById('lastName').value;
    const age = document.getElementById('age').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    // Basic form validation
    if (!firstName || !lastName || !age || !email || !phone || !password || !confirmPassword) {
        alert("Please fill in all fields.");
        return;
    }

    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return;
    }

    // Check if age is 18 or older
    if (age < 18) {
        alert("You must be 18 or older to register.");
        return;
    }

    // All fields validated, show success message
    alert(`Registration successful!\n\nName: ${firstName} ${lastName}\nEmail: ${email}`);
});
