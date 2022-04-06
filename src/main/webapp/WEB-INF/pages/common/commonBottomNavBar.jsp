<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title>Footer</title>
    <style>
        .fa-color{
            color: white;
        }
        .effect:hover{
            color: black;
        }
        /* The Modal (background) */
.modal {
  display: none;
    position: relative;
    z-index: 1;
    padding-top: 111px;
    left: 624px;
    top: -653px;
    width: 50rem;
    height: 26rem;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
}


.modal-content {
   position: relative;
    top: -3rem;
    display: flex;
    flex-direction: column;
    width: 100%;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: 0.3rem;
    outline: 0;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
    </style>
</head>
<body>

    <footer class="" style="margin-top: auto">
        <div class="container-fluid bg-danger">
            <div class="row">
                <div class="col text-light pt-2">
                    <h4>Reach Us:</h4>
                    <h3>number</h3>
                    <p>email</p>
                </div>

                <div class="col text-light pt-2">
                   <h4>Visit Us:</h4>
                   <p>
                       location
                       <br>
                      azamgarh
                   </p>
                </div>

                <div class="col text-light pt-2">
                    <h4 class="d-flex justify-content-end">Connect with us:</h4>
                    <ul class="list-unstyled list-inline d-flex justify-content-end">
                        <li class="list-inline-item">
                           <a href="https://www.facebook.com/profile.php?id=100008296806312" target="_blank"><i class="fab fa-facebook fa-color effect"></i></a>
                          </li>
                          <li class="list-inline-item">
                           <a href="https://twitter.com/prince46255?t=Y2oFDtUyWz4l8L053UYG3A&s=09" target="_blank"><i class="fab fa-twitter fa-color effect"></i></a>
                          </li>
                          <li class="list-inline-item">
                          <a href="https://www.instagram.com/invites/contact/?i=1ry8lgy6dk6ke&utm_content=2vbeuw0" target="_blank"><i class="fab fa-instagram fa-color effect"></i></a>
                          </li>
                      </ul>
                </div>

                <div class="col text-light pt-2">
                    <h4 class="d-flex justify-content-end">Chat With US:</h4>
                    <ul class="list-unstyled list-inline d-flex justify-content-end">
                        <li class="list-inline-item">
                            <a id="myBtn" ><i class="far fa-comments fa-color effect"></i></a>
                        </li>
                    </ul>
                </div>

            </div>

            <div class="row">
                <div class="col text-light">
                    <p class="text-center pb-4">Â© 2022 Lakshdeep Foundation Azamgarh</p>
                </div>

            </div>
        </div>
    </footer>

</div>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Lakshdeep Foundation</h2>
    </div>
    <div class="modal-body">
      <p>Welcome please conatact on below Whatsapp Number</p>
      <p>Some other text...</p>
    </div>
    <div class="modal-footer">
      <h3></h3>
    </div>
  </div>

</div>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</body>
</html>