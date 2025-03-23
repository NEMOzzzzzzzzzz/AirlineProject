function validateLogin() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
  
    // Dummy credentials for demonstration
    const validUsername = "user123";
    const validPassword = "password123";
  
    if (username === validUsername && password === validPassword) {
      alert("Login successful!");
      // Redirect to the homepage or dashboard
      window.location.href = "home.html";
    } else {
      alert("Invalid username or password. Please try again.");
    }
  
    // Prevent form submission for now
    return false;
  }
  