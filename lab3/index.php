<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab 3 - GET and POST</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: <?php 
                
                if (isset($_POST['color'])) {
                    echo htmlspecialchars($_POST['color']);
                } elseif (isset($_GET['color'])) {
                    echo htmlspecialchars($_GET['color']);
                } else {
                    echo '#ffffff';
                }
            ?>;
            transition: background-color 0.3s ease;
            min-height: 100vh;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <h1 class="mb-4 text-center">Lab Work 3</h1>
        <h2 class="text-center mb-5">Part 1: GET and POST Methods</h2>
        
      
        <div class="row mb-4">
            <div class="col-md-6">
                <?php if (isset($_GET['color'])): ?>
                    <div class="alert alert-info">
                        <h6>GET Method Active:</h6>
                        Current background color: <strong><?php echo htmlspecialchars($_GET['color']); ?></strong><br>
                        Parameter visible in URL: <code>?color=<?php echo htmlspecialchars($_GET['color']); ?></code>
                    </div>
                <?php elseif (isset($_POST['color'])): ?>
                    <div class="alert alert-success">
                        <h6>POST Method Active:</h6>
                        Current background color: <strong><?php echo htmlspecialchars($_POST['color']); ?></strong><br>
                        Parameter <strong>not visible</strong> in URL
                    </div>
                <?php else: ?>
                    <div class="alert alert-secondary">
                        <h6>Initial State:</h6>
                        Choose a color using GET or POST method
                    </div>
                <?php endif; ?>
            </div>
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h6>Method Information:</h6>
                        <ul class="small">
                            <li><strong>GET</strong> - parameters in URL, not secure</li>
                            <li><strong>POST</strong> - parameters hidden, more secure</li>
                            <li>Try both methods!</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- GET -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0">GET Method</h5>
                    </div>
                    <div class="card-body">
                        <form action="" method="GET">
                            <div class="mb-3">
                                <label for="color_get" class="form-label">Choose background color:</label>
                                <input type="color" class="form-control form-control-color" id="color_get" 
                                       name="color" value="<?php 
                                       echo isset($_GET['color']) ? htmlspecialchars($_GET['color']) : '#563d7c'; 
                                       ?>">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Apply Color (GET)</button>
                        </form>
                        <div class="mt-3 p-2 bg-light rounded small">
                            <strong>GET Features:</strong>
                            <ul class="mb-0 mt-2">
                                <li>Parameters visible in address bar</li>
                                <li>Can be modified manually via URL</li>
                                <li>Not secure for confidential data</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- POST -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0">POST Method</h5>
                    </div>
                    <div class="card-body">
                        <form action="" method="POST">
                            <div class="mb-3">
                                <label for="color_post" class="form-label">Choose background color:</label>
                                <input type="color" class="form-control form-control-color" id="color_post" 
                                       name="color" value="<?php 
                                       echo isset($_POST['color']) ? htmlspecialchars($_POST['color']) : '#20c997'; 
                                       ?>">
                            </div>
                            <button type="submit" class="btn btn-success w-100">Apply Color (POST)</button>
                        </form>
                        <div class="mt-3 p-2 bg-light rounded small">
                            <strong>POST Features:</strong>
                            <ul class="mb-0 mt-2">
                                <li>Parameters hidden from user</li>
                                <li>More secure for confidential data</li>
                                <li>Cannot be modified via URL</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>