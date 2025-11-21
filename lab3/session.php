<?php
session_start();


if (isset($_POST['logout'])) {
    session_destroy();
    header('Location: ' . $_SERVER['PHP_SELF']);
    exit;
}


if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];
    $logged_in = true;
} else {
    $logged_in = false;
    $username = '';
    

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['username'])) {
        $input_username = $_POST['username'];
        $input_password = $_POST['password'];
        

        if ($input_username === 'admin' && $input_password === 'password123') {

            $_SESSION['username'] = $input_username;
            $_SESSION['login_time'] = time();
            $_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
            header('Location: ' . $_SERVER['PHP_SELF']);
            exit;
        } else {
            $error = "Invalid username or password!";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lab 3 Part 2 - Session Login</title>
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
            height: 100vh;
        }
        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }
        .form-signin .checkbox {
            font-weight: 400;
        }
        .form-signin .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body class="text-center">

<?php if ($logged_in): ?>
    <!-- Welcome -->
    <div class="container">
        <div class="alert alert-success">
            <h1 class="h3 mb-3 font-weight-normal">Welcome, <?php echo htmlspecialchars($username); ?>! 🔒</h1>
            <p>You are logged in using secure sessions.</p>        
            <!-- Logout-->
            <form method="POST" class="mt-4">
                <button type="submit" name="logout" class="btn btn-lg btn-warning btn-block">Logout</button>
            </form>
        </div>
    </div>

<?php else: ?>
    <!-- Login form -->
    <form class="form-signin" method="POST">
        <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Lab 3 - Session Login</h1>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php endif; ?>
        
        <label for="username" class="sr-only">Username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Username" value="admin" required autofocus>
        
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" value="password123" required>
        
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Secure session login
            </label>
        </div>
        
        <button class="btn btn-lg btn-success btn-block" type="submit">Sign in with Sessions</button>
        
        
        <p class="mt-3 mb-3 text-muted">© Lab 3 - Session Authentication</p>
    </form>
<?php endif; ?>

</body>
</html>