<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<style>
    *
{
    padding: 0;
    margin: 0;
    font-family: sans-serif;
    box-sizing: border-box;
}
body
{
    height: 100vh;
    width: 100%;
    display: grid;
    place-items: center;
    background-color:aliceblue ;
}
form
{
    height: auto;
    width: 450px;
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    position: relative;
    background-position: center;
    box-shadow: -2px 2px 12px rgba(0,0,0,0.3);
    transform: translate(-5%,-1%);
}
form h2
{
    font-size: 40px;
}
p{
    height: auto;
    width: 100%;
    text-decoration: none;
    padding: 0 15px;
    font-size: 19px;
    line-height: 40px;
    margin: 10px 0;
    color: #000;
    border-radius: 4px;
}
p a{
    text-decoration: none;
}
 input{
    height: 40px;
    width: 70%;
    margin: 5px 0;
    border: 1px solid #00000031;
    font-size: 15px;
    background: #f5f6f7;
    outline: none;
    border-radius: 5px;
    padding: 10px 20px;
}
form input[type="submit"]
{
    height: 45px;
    border: none;
    width: 100%;
    background-color:skyblue;
    color: black;
    font-size: 20px;
    margin: 5px 0;
    cursor: pointer;
}
form table a{
    text-decoration: none;

}
form table a:hover{
    color: #0557ee;
}
form input[type="submit"]:hover{
    background: #0557ee;
    color: white;
    
}
table input:hover{
    box-shadow: #000;
}
form .input-field{
    background: grey;
    margin: 15px 0;
    border-radius: 3px;
    display: flex;
    align-items: center;
}
form .input{
    width: 100%;
    background: grey;
    border:0;
    outline: 0;
    padding: 18px 15px;
}
p a:hover{
     color: #0557ee;
}






</style>
<body>
    <?php 
    
    $cnn=mysqli_connect('localhost','root','','edoc');
    if(isset($_POST['submit'])){
        $email=$_POST['useremail'];
        $npwd=$_POST['npwd'];
        $cpwd=$_POST['cpwd'];
       
        $sql="SELECT pemail from patient where pemail='$email'";
        $query=mysqli_query($cnn,$sql);
        $num=mysqli_fetch_array($query);
        
        if(empty($email)){
            $_SESSION['msg']="Enter the all fields";

        }
        if(empty($npwd))
            $_SESSION['msg']="Enter the all the fields";

        }
        if(empty($cpwd)){
            $_SESSION['msg']="Enter the all the fields";

        }
        elseif (!preg_match("/^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/", $npwd)) {
            $_SESSION['msg'] = 'Password must contain at least 8 characters, one capital letter, and one number.';
        }
        elseif($npwd!=$cpwd){
            $_SESSION['msg']="password does not match";
        }
        
        elseif($npwd==$cpwd){
            $con=mysqli_query($cnn,"UPDATE patient SET ppassword='$npwd' WHERE pemail='$email'");
            $_SESSION['msg']="password changed successfully!Now you can login.";
        }
        else
        {
            $con=mysqli_query($cnn,"UPDATE patient SET ppassword='$npwd' WHERE pemail='$email'");
            $_SESSION['msg']="password changed successfully!Now you can login.";
        }

      




?>


    <form name="chngpwd" action="" method="post" onsubmit="return valid();">
    <h2>Reset Password</h2>
    <p style="color: red;"><?php echo $_SESSION['msg'];?></p>

  
       
       
  <div class="inputfield">
       <i class='bx bx-envelope'></i>
      <input type="email" name="useremail"  placeholder="Enter Your Email" ><br>
       </div>
       <div class="inputfield">
       <i class='bx bx-lock-alt'></i>
      <input type="password" name="npwd"  placeholder="Create  Your new Password"><br>
       </div>
       <div class="inputfield">
       <i class='bx bx-lock-open-alt'></i>
      <input type="password" name="cpwd" placeholder="Confirm Your  Password"><br>
       </div>
       <input type="submit" name="submit" value="Reset Password" class="submit"><br>
       <p> <a href="login.php">Back To Login!</a></p>
</form>
</body>
</html>