<?php $this->render("Shared", "header", ["css" => "loginPage", "title" => "Login Page"]); ?>

    <div class="login-container">
            <?php if(!isset($user)) {?>
            <form action="index.php?c=User&a=login" method="POST">
                <h2>Login</h2>
                <?php if (isset($error)) {
                    // echo '<p style="color: red;">' . $error . '</p>';
                } ?>
                <label for="username"> Username: </label>
                <input type="text" name="username" required><br><br>

                <label for="password"> Password: </label>
                <input type="password" name="password" required><br><br>
                <input type="submit" value="Login">
            </form>
            <?php } else {?>
                <h2>Login</h2>
                <?= "<p>You are already logged in " . $user['username'] . " living at " . $user['address'] . ".</p>" ?>
            <?php }?>
        </div>    

        <?php $this->render("Shared", "footer"); ?>