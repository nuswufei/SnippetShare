<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SnippetShare</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <script src="http://code.jquery.com/jquery.js"></script>

    <link rel="stylesheet" href="assets/cyborg/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="assets/cyborg/css/bootswatch.min.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../bower_components/html5shiv/dist/html5shiv.js"></script>
      <script src="../bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
    <script>

     var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-23019901-1']);
      _gaq.push(['_setDomainName', "bootswatch.com"]);
        _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();

    </script>
    <script type="text/javascript">
      function createsnippet(){ 
        var myform = document.createElement("form");
        myform.action = "user/createsnippet";
        myform.method = "post";

        var title = document.createElement("input");
        title.value = document.getElementById("snippettitle").value;
        title.name = "title";
        var tags = document.createElement("input");
        tags.value = document.getElementById("snippettag").value;
        tags.name = "tags";
        var content = document.createElement("input");
        content.value = document.getElementById("snippetcontent").value;
        content.name = "content";
        var boardid = document.createElement("input");
        boardid.value = document.getElementById("snippetboard").value;
        boardid.name = "boardID";

        myform.appendChild(title);
        myform.appendChild(tags);
        myform.appendChild(content);
        myform.appendChild(boardid);

        document.body.appendChild(myform);
        myform.submit();
        document.body.removeChild(myform);
      } 

      function createboard(){
        var myform = document.createElement("form");
        myform.action = "user/createboard";
        myform.method = "post";

        var title = document.createElement("input");
        title.value = document.getElementById("boardtitle").value;
        title.name = "title";
        var access = document.createElement("input");
        access.value = document.getElementById("boardaccess").value;
        access.name = "access";
        var categpry = document.createElement("input");
        categpry.value = document.getElementById("boardcategory").value;
        categpry.name = "category";

        myform.appendChild(title);
        myform.appendChild(access);
        myform.appendChild(categpry);

        document.body.appendChild(myform);
        myform.submit();
        document.body.removeChild(myform);
      }

      function deleteaction(elem){

        var myform = document.createElement("form");
        myform.action = "user/deletesnippet";
        myform.method = "post";
        var product = document.createElement("input");
        product.type = "num"
        product.value = elem.value;
        product.name = "id";
        myform.appendChild(product);
        document.body.appendChild(myform);
        myform.submit();
        document.body.removeChild(myform);
      }
      function createcomment(content, id){
      	var x = document.getElementById(content + 'text').value;

      	var myform = document.createElement("form");
        myform.action = "user/creatcomment";
        myform.method = "post";
        
        var content = document.createElement("input");
        content.value = x;
        content.name = "content";

        var snippetid = document.createElement("input");
        snippetid.value = id;
        snippetid.name = "snippetid";

        myform.appendChild(content);
        myform.appendChild(snippetid);

        document.body.appendChild(myform);
        myform.submit();
        document.body.removeChild(myform);

      }
    </script>
  </head>
  <body>
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="../" class="navbar-brand"><font color="#f44d3c">SnippetShare</font></a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
            <ul class="nav navbar-nav">
 
            </ul>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" target="_blank">Profile</a></li>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="">${currentUser}</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
          </ul>

        </div>
      </div>
    </div>


    <div class="container">
        <div class="row">
	      <div class="col-lg-8">
	        <h2 id="nav-tabs">Snippets</h2>
	        <div class="bs-component">
	          <ul class="nav nav-tabs">
	            <li class="active"><a href="#home" data-toggle="tab">Snippets List</a></li>
	            <li><a href="#profile" data-toggle="tab">New Snippet</a></li>
	            <li><a href="#board" data-toggle="tab">New Board</a></li>
	          </ul>
	          <div id="myTabContent" class="tab-content">
	            <div class="tab-pane fade active in" id="home">
	                <h1>${board.title}</h1>
                    <c:forEach items="${snippets}" var="s">                       
                      <div class="bs-component">
                        <div class="modal">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h4 class="modal-title">${s.title}</h4>
                                <span class="badge">${s.tags}</span>
                              </div>
                              <div class="modal-body">
                                <p>${s.content}</p>
                              </div>
                              <div class="modal-footer">
                                <button type="button" id="deletebtn" value="${s.id}" class="btn btn-default" data-dismiss="modal" onclick="deleteaction(this)">Delete</button>
                                <a href="editsnippet.jsp?title=${s.title}&tags=${s.tags}&contents=${s.content}&snippetid=${s.id}" class="btn btn-primary">Edit</a>
                                
                                <a class="btn btn-primary"a href="user/getsnippetbyid?id=${s.id}">ShowComments</a>
                              </div>
                              <div class="modal-footer">
		                          <label for="textArea" class="col-lg-2 control-label">Comment</label>
		                          <div class="col-lg-10">
		                            <textarea class="form-control" rows="3" id="${s.title}text"></textarea>
		                          </div>
		                          <br>	                          
                              </div>
                              <div class="modal-footer">
                              		<button type="button" class="btn btn-success" onclick="createcomment('${s.title}','${s.id}')">Add Comment</button>	
                              </div>
                              
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
	            </div>
	            <div class="tab-pane fade" id="profile">
					<div class="col-lg-10">
                      
                        <div class="form-group">
                          <label for="inputTitle" class="col-lg-2 control-label">Title</label>
                          <div class="col-lg-10">
                            <input type="text" class="form-control" id="snippettitle" name="title">
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="inputTags" class="col-lg-2 control-label">Tags</label>
                          <div class="col-lg-10">
                            <input type="text" class="form-control" id="snippettag" name="tags">
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="textArea" class="col-lg-2 control-label">Content</label>
                          <div class="col-lg-10">
                            <textarea class="form-control" rows="3" id="snippetcontent" name="content"></textarea>
                          </div>
                        </div> 

                        <div class="form-group">
                          <label for="inputID" class="col-lg-2 control-label">BoardID</label>
                          <div class="col-lg-10">
                            <select class="form-control" id="snippetboard">
                              <c:forEach items="${ownBoards}" var="s">
                                <option value=${s.id}><label>${s.title}</label></option>
                              </c:forEach>                              
                            </select>
                          </div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="row">
                          <div class="col-md-2">
                            <button class="btn btn-md btn-success" onclick="createsnippet()">Create</button>
                          </div>
                        </div>
                     
                    </div>

	            </div>
	            <div class="tab-pane fade" id="board">
                    <div class="col-lg-10">

                        <div class="form-group">
                          <label for="inputTitle" class="col-lg-2 control-label">Title</label>
                          <div class="col-lg-10">
                            <input type="text" class="form-control" id="boardtitle" name="title">
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="inputTags" class="col-lg-2 control-label">Access</label>
                          <div class="col-lg-10">
                            <select class="form-control" id="boardaccess">
                              <option value="public"><label>public</label></option>
                              <option value="private"><label>private</label></option>
                            </select>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="inputID" class="col-lg-2 control-label">Category</label>
                          <div class="col-lg-10">
                            <input type="text" class="form-control" id="boardcategory" name="boardID">
                          </div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <div class="row">
                          <div class="col-md-2">
                            <input type="submit" value="Create" type="button" class="btn btn-md btn-success" onclick="createboard()">
                          </div>
                        </div>
                      
                    </div>  
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    <br>
	    <br>
	    <a class="btn btn-md btn-success" href="http://arboreal-harbor-92603.appspot.com/index">Back</a>

      <footer>
        <div class="row">
          <div class="col-lg-12">

            <ul class="list-unstyled">
              <li class="pull-right"><a href="#top">Back to top</a></li>
              <li><a href="http://feeds.feedburner.com/">RSS</a></li>
              <li><a href="https://twitter.com/">Twitter</a></li>
              <li><a href="https://github.com/nuswufei/SnippetShare">GitHub</a></li>
            </ul>
            <p>Made by Team..</p>
            <p>Code released under the <a href="https://github.com/nuswufei/SnippetShare">MIT License</a>.</p>
          </div>
        </div>

      </footer>

    </div>
    
	

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/cyborg/js/bootswatch.js"></script>
  	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    (function(){try{var s,a,i,j,r,c,l=document.getElementsByTagName("a"),t=document.createElement("textarea");for(i=0;l.length-i;i++){try{a=l[i].getAttribute("href");if(a&&a.indexOf("/cdn-cgi/l/email-protection") > -1  && (a.length > 28)){s='';j=27+ 1 + a.indexOf("/cdn-cgi/l/email-protection");if (a.length > j) {r=parseInt(a.substr(j,2),16);for(j+=2;a.length>j&&a.substr(j,1)!='X';j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}j+=1;s+=a.substr(j,a.length-j);}t.innerHTML=s.replace(/</g,"&lt;").replace(/>/g,"&gt;");l[i].setAttribute("href","mailto:"+t.value);}}catch(e){}}}catch(e){}})();
    /* ]]> */
    </script>
</body>
</html>
