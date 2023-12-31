<?php
//Include the connection file
include_once "CoreModel.php";

//Create user class
class User{
    //Create properties of a user object
    public $uID;
    public $firstName;
    public $lastName;
    public $telephoneNumber;
    public $address;
    public $postalCode;
    public $username;
    public $password;
    public $isAdmin;

    //Create the class constructor
    function __construct($uID = -1){
        //Call global $conn
        global $conn;

        //Set the uID to the uID provided
        $this->uID = $uID;

        //If the uID is invalid...
        if($uID < 0){
            $this->firstName = "";
            $this->lastName = "";
            $this->telephoneNumber = "";
            $this->address = "";
            $this->postalCode = "";
            $this->username = "";
            $this->password = "";
            $this->isAdmin = "";
        } else {
            //If the user is valid...

            //Run an sql statement to retrieve the data for the user in the db
            $sql = "SELECT * FROM `users` WHERE `uID` =" . $uID;

            //Call the query feature of the conn using our statement
            $result = $conn->query($sql);

            //Format the data into an associative array
            $data = $result->fetch_assoc();

            //Populate the new object with our fetched data
            $this->firstName = $data['firstName'];
            $this->lastName = $data['lastName'];
            $this->telephoneNumber = $data['telephoneNumber'];
            $this->address = $data['address'];
            $this->postalCode = $data['postalCode'];
            $this->username = $data['username'];
            $this->password = $data['password'];
            $this->isAdmin = $data['isAdmin'];
        }
    }

    public static function retrieveAllUsers(){
        //Call global conn
        global $conn;

        //Create the sql statement to retrieve all users
        $sql = "SELECT * FROM `users`";
        
        //Run sql statement
        $result = $conn->query($sql);

        //if error...
        if(!$result){
            die("Error: " . $conn->error);
        }

        //Create empty array for the users
        $users = array();

        //Populate array with fetched data
        while($row = $result->fetch_assoc()){
            $users[] = $row;
        }

        //Return the array
        return $users;
    }

    public function deleteUser($uID){
        //Call global conn
        global $conn;

        //Create sql statement to delete the user
        $sql = "DELETE FROM `users` WHERE uID=?";

        //Prepare the statement
        $stmt = $conn->prepare($sql);

        //Bind parameters to the statement
        $stmt->bind_param("i", $uID);

        //Execute the statement
        if($stmt->execute()){
            return "User with ID: " . $uID . " deleted successfully";
        } else {
            return "Deletion error: " . $stmt->error;
        }
    }

    public function promoteUser($uID){
        //Call global conn
        global $conn;

        //Create sql statement to promote user to admin
        $sql = "UPDATE `users` SET isAdmin=1 WHERE uID=$uID";

        //Execute stmt
        if($conn->query($sql) === TRUE){
            return "User with ID: " . $this->uID . "successfully promoted.";
        } else {
            return "Promotion error: " . $conn->error;
        }
    }

    public function updateUser($uID){
        //Call global conn
        global $conn;

        //Create sql statement to update the user
        $sql = "UPDATE `users` SET firstName=?, lastName=?, telephoneNumber=?, address=?, postalCode=?, username=?, password=? WHERE uID=$uID";

        $stmt = $conn->prepare($sql);

        //Bind parameters to sql stmt
        $stmt->bind_param("sssssss", $_POST['firstName'], $_POST['lastName'], $_POST['telephoneNumber'], $_POST['address'], $_POST['postalCode'], $_POST['username'], $_POST['password']);

        //Execute stmt
        if($stmt->execute()){
            return "User with ID: " . $uID . "updated successfully";
        } else {
            return "Update error: " . $stmt->error;
        }
    }

    public static function addUser($firstName = "", $lastName = "", $telephoneNumber = "", $address = "", $postalCode = "", $username = "", $password = ""){
        //Call global conn
        global $conn;

        //Regex validation patterns
        $namePattern = "/^[A-Z][a-z]*$/";
        $phonePattern = "/^\d{3}-\d{3}-\d{4}$/";
        $postalCodePattern = "/^[A-Z]\d[A-Z]\d[A-Z]\d$/";
        $passwordPattern = "/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/";
        
        // Validate inputs using regular expressions
        if (!preg_match($namePattern, $firstName)) {
            return false;
        }

        if (!preg_match($namePattern, $lastName)){
            return false;
        }

        if (!preg_match($phonePattern, $telephoneNumber)) {
            return false;
        }

        if (!preg_match($postalCodePattern, $postalCode)) {
            return false;
        }

        if (!preg_match($passwordPattern, $password)) {
            return false;
        }

        //Create sql statement to add a user
        $sql = "INSERT INTO `users` (firstName, lastName, telephoneNumber, address, postalCode, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

        //Prepare statement
        $stmt = $conn->prepare($sql);

        //Bind parameters to statement
        $stmt->bind_param("sssssss", $_POST['firstName'], $_POST['lastName'], $_POST['telephoneNumber'], $_POST['address'], $_POST['postalCode'], $_POST['username'], $_POST['password']);

        //Execute statement
        return $stmt->execute();
    }

    public static function checkLoginUser($username, $password){
        //Call global $conn
        global $conn;

        //Create sql statement to get user by username
        $sql = "SELECT * FROM `users` WHERE username='$username' AND password='$password'";

        //Run sql statement
        $result = $conn->query($sql);

        //if error...
        if(!$result){
            die("Error: " . $conn->error);
        }

        //Return the array
        return $result->fetch_assoc();
    }

    public static function getUserByUsername($username){
        //Call global $conn
        global $conn;

        //Create sql statement to get user by username
        $sql = "SELECT * FROM `users` WHERE username='$username'";

        //Run sql statement
        $result = $conn->query($sql);

        //if error...
        if(!$result){
            die("Error: " . $conn->error);
        }

        //Return the array
        return $result->fetch_assoc();
    }

    public static function getUserByuID($uID){
        //Call global $conn
        global $conn;

        //Create sql statement to get user by username
        $sql = "SELECT * FROM `users` WHERE uId='$uID'";

        //Run sql statement
        $result = $conn->query($sql);

        //if error...
        if(!$result){
            die("Error: " . $conn->error);
        }

        //Return the array
        return $result->fetch_assoc();
    }

}
