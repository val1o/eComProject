<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Views/Home/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

    <title>Document</title>
    <link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
  integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
  <div id="overlay">
    <img id="overlayImage" src="Views/Home/3d-renders-co-uk-3d-printing-338407289.svg" alt="Overlay Image" />
    <div id="textOverlay">Welcome</div>
  </div>

  <div id="content" class="hidden revealContent">
    <nav>
    <input type="checkbox" id="check">
    <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i>
    </label>
    <label class="logo">3D Printing Montreal</label>
    <ul>
      <li><a class="active" href="#">Home</a></li>
      <li><a href="#">Service</a></li>
      <li><a href="#">Templates</a></li>
      <li><a href="index.php?c=User&a=profile">Profile</a></li>
      <li><a href="index.php?c=User&a=register">Register</a></li>
      <li><a href="index.php?c=User&a=login">Login</a></li>
      <li><a href="index.php?c=User&a=logout">Logout</a></li>
    </ul>
    </nav>
  </div>

  <script>
        window.onload = function () {
            const overlay = document.getElementById('overlay');
            const content = document.getElementById('content');
            const textOverlay = document.getElementById('textOverlay');

            overlay.addEventListener('click', function () {
                textOverlay.style.display = 'none';
                content.classList.remove('hidden');
                overlay.style.transition = '0.5s';
                overlay.style.opacity = '0';
                overlay.style.pointerEvents = 'none';
            });
        };
    </script>



</body>
</html>