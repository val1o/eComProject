<?php
//Include the connection file
include_once "CoreModel.php";

class Comment{
    public $commentID;
    public $timeOfCreation;
    public $header;
    public $body;
    public $template_id;
    public $user_id;

    function __construct($commentID = -1){
        global $conn;

        $this->commentID = $commentID;

        if($commentID < 0){
            $this->timeOfCreation = "";
            $this->header = "";
            $this->body = "";
            $this->template_id = "";
            $this->user_id = "";
        } else {
            
            $sql = "SELECT * FROM `comments` WHERE `commentID` =" . $commentID;

            $result = $conn->query($sql);

            $data = $result->fetch_assoc();

            $this->timeOfCreation = $data['timeOfCreation'];
            $this->header = $data['header'];
            $this->body = $data['body'];
            $this->template_id = $data['template_id'];
            $this->user_id = $data['user_id'];
        }
    }

    public static function createComment(){
        global $conn;

        $sql = "INSERT INTO `comments` (header, body, template_id, user_id) VALUES (?, ?, ?, ?)";

        $stmt = $conn->prepare($sql);

        $stmt->bind_param("ssii", $_POST['header'], $_POST['body'], $_POST['templateID'], $_POST['user_id']);

        if($stmt->execute()){
            echo "Addition successful";
        } else {
            echo "Error: " . $stmt->error;
        }
    }

    public static function deleteComment($commentID){
        global $conn;

        $sql = "DELETE FROM `comments` WHERE commentID=?";

        $stmt = $conn->prepare($sql);

        $stmt->bind_param("i", $commentID);

        $stmt->execute();
    }

    public static function getAllCommentsForATemplate($templateID) {
        global $conn;

        $sql = "SELECT * FROM `comments` WHERE template_id=$templateID";

        $result  =$conn->query($sql);

        $comments = array();

        while($row = $result->fetch_assoc()){
            $comments[] = $row;
        }

        return $comments;
    }
}