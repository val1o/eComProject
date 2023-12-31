<?php
    include_once 'CoreModel.php';
    include_once 'CoreController.php';
    include_once 'Models/Template.php';
    include_once 'Models/User.php';
    include_once 'Models/Comment.php';

    class TemplateController extends CoreController {

        public function route(){
            
            $action = (isset($_GET['a']) ? $_GET['a'] : "viewAllTemplates");

            switch($action){
                case "viewAllTemplates":
                    $template = new Template();
                    $allTemplates = $template->displayAllTemplates();
                    $this->render('User', 'systemManager', $allTemplates);
                    break;

                case "createTemplate":
                    $this->createTemplate();
                    break;

                case "deleteTemplate":
                    $this->deleteTemplate();
                    break;

                case "retrieveCommunityTemplate":
                    $this->retrieveCommunityTemplate();
                    break;

                case "retrieveMyTemplates":
                    $this->retrieveMyTemplates();
                    break;

                case "printService":
                    $this->renderPrintService();
                    break;

                case "sendToCheckout":
                    $this->sendToCheckout();
                    break;

                case "addToOrders":
                    $this->addTemplateToOrder();
                    break;
            }
        }

        private function addTemplateToOrder(){
            
            $this->render("User", "orders");
        }

        private function createTemplate(){
            if(isset($_POST['file'])
             && isset($_POST['theme']) && isset($_POST['title'])
             && isset($_POST['description'])){

                $file = $_POST['file'];

                date_default_timezone_get();
                $creationDate = date('Y-m-d H:i:s');

                $theme = $_POST['theme'];
                $title = $_POST['title'];
                $description = $_POST['description'];

                //ToDO: fix as session is null
                $user_id = $_SESSION['uID'];

                $template = new Template();

                $template = $template->createTemplate($file, $creationDate, $theme,
                    $title, $description, $user_id);

             } else {
                $this->render("Template", "createTemplate");
             }
        }

        private function deleteTemplate(){
            if(isset($_POST['delete'])){

                $template = new Template();
                $template->deleteTemplate($_POST['templateID']);

                echo "Template deleted";
            } else {
                echo "pls do not probe the website";
            }
        }

        private function retrieveCommunityTemplate(){
            if(isset($_POST['templateID'])){

                $templateID = $_POST['templateID'];

                $template = new Template();
                $template = $template->getTemplate($templateID);

                $this->render("Template", "myTemplates", ['template' => $template]);
            } else {
                $this->render("Template", "myTemplates");
            }
        }

        private function sendToCheckout(){

            if(isset($_POST['templateID'])){

                $templateID = $_POST['templateID'];

                $template = new Template();
                $template = $template->getTemplate($templateID);

                $this->render("User", "checkout", ['template' => $template]);
            } else {
                $this->render("Template", "printService");
            }
        }

        private function retrieveMyTemplates(){

            if(isset($_SESSION['uID'])){

                $user_id = $_SESSION['uID'];

                $template = new Template();
                $template = $template->displayMyTemplates($user_id);

                $this->render("Template", "myTemplates", ['template' => $template]);
            }
        }

        private function renderPrintService(){

            if(isset($_POST['templateID'])){

                $templateID = $_POST['templateID'];

                    $template = new Template();
                    $template = $template->getTemplate($templateID);

                    $comment = new Comment();
                    $comments = $comment->getAllCommentsForATemplate($templateID);

                    $user = new User();

                    $this->render("Template", "printService", ['template' => $template, 'comments' => $comments, 'user' => $user]);
        } else {
                $this->render("Home", "home");
        }
    }
}





?>