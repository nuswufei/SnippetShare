<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SnippetShare</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <script src="http://code.jquery.com/jquery.js"></script>

    <link rel="stylesheet" href="../assets/cyborg/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="../assets/cyborg/css/bootswatch.min.css">
  </head>
  <body>
    <div class="container">
    	<div class="row">
          <div class="col-lg-12">
            <h2>Alerts</h2>
            <div class="bs-component">
              <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4>Error!</h4>
                <p>${errorMessage}</p>
              </div>
              <a class="btn btn-success" href="http://arboreal-harbor-92603.appspot.com/index">Back</a>
            </div>
          </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/cyborg/js/bootswatch.js"></script>
</body>
</html>
