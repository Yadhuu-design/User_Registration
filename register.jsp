
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Festalive</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Quicksand', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(270deg, #000, #0f0, #000);
            background-size: 600% 600%;
        }

        @keyframes gradientBackground {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        section {
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        section .signin {
            width: 400px;
            background: #222;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.9);
            z-index: 1;
        }

        section .signin .content {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 40px;
        }

        section .signin .content h2 {
            font-size: 2em;
            color: #0f0;
            text-transform: uppercase;
        }

        section .signin .content .form {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        section .signin .content .form .inputBox {
            position: relative;
            width: 100%;
        }

        section .signin .content .form .inputBox input {
            width: 100%;
            background: #333;
            border: none;
            outline: none;
            padding: 25px 10px 7.5px;
            border-radius: 4px;
            color: #fff;
            font-weight: 500;
            font-size: 1em;
        }

        section .signin .content .form .inputBox i {
            position: absolute;
            left: 10px;
            top: 15px;
            color: #aaa;
            transition: 0.5s;
            pointer-events: none;
        }

        .signin .content .form .inputBox input:focus ~ i, 
        .signin .content .form .inputBox input:valid ~ i {
            transform: translateY(-7.5px);
            font-size: 0.8em;
            color: #fff;
        }

        .signin .content .form .links {
            display: flex;
            justify-content: space-between;
        }

        .signin .content .form .links a {
            color: #fff;
            text-decoration: none;
        }

        .signin .content .form .links a:nth-child(2) {
            color: #0f0;
            font-weight: 600;
        }

        .signin .content .form .inputBox input[type="submit"] {
            padding: 10px;
            background: #0f0;
            color: #000;
            font-weight: 600;
            font-size: 1.35em;
            letter-spacing: 0.05em;
            cursor: pointer;
        }

        input[type="submit"]:active {
            opacity: 0.6;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 15px;
            cursor: pointer;
            color: #aaa;
        }

        .toggle-password:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <section>
        <div class="signin">
    <div class="content">
        <h2>Sign Up</h2>
        <form action="registerservice.jsp" method="post" onsubmit="return validateForm()">
            <div class="form">
                <div class="inputBox">
                    <input type="text" name="email" id="email"><i>Email</i>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" id="password"><i>Password</i>
                    <span class="toggle-password" onclick="togglePassword('password', this)">👁️</span>
                </div>
                <div class="inputBox">
                    <input type="password" name="cpassword" id="cpassword"><i>Confirm Password</i>
                    <span class="toggle-password" onclick="togglePassword('cpassword', this)">👁️</span>
                </div>
              
                <div class="inputBox">
                    <input type="submit" value="Sign Up">
                </div>
                  <div class="links">
                            <a href="login.jsp">Already have an Account? Login</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
function validateForm() {
    var email = document.getElementById('email').value.trim();
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('cpassword').value;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!emailRegex.test(email)) {
        alert('Please enter a valid email address.');
        document.getElementById('email').focus();
        return false;
    }

    if (!passwordRegex.test(password)) {
        alert('Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, one number, and one special character.');
        document.getElementById('password').focus();
        return false;
    }

    if (password !== confirmPassword) {
        alert('Passwords do not match.');
        document.getElementById('cpassword').focus();
        return false;
    }

    return true; // Submit the form
}

function togglePassword(fieldId, toggleElement) {
    var passwordField = document.getElementById(fieldId);
    if (passwordField.type === "password") {
        passwordField.type = "text";
        toggleElement.textContent = "🙈"; // Change to closed eye icon
    } else {
        passwordField.type = "password";
        toggleElement.textContent = "👁️";
    }
}
</script>

</body>
</html>
 