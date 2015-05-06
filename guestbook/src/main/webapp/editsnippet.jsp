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

      function editsnippet(){
        var myform = document.createElement("form");
        myform.action = "user/updatesnippet";
        myform.method = "post";

        var title = document.createElement("input");
        title.value = document.getElementById("snippettitle").value;
        title.name = "title";
        var tags = document.createElement("input");
        tags.value = document.getElementById("snippettag").value;
        tags.name = "tags";
        var contents = document.createElement("input");
        contents.value = document.getElementById("snippetcontent").value;
        contents.name = "content";

        var id = document.createElement("input");
        id.value = document.getElementById("snippetid").value;
        id.name = "id";

        myform.appendChild(title);
        myform.appendChild(tags);
        myform.appendChild(contents);
        myform.appendChild(id);

        document.body.appendChild(myform);
        myform.submit();
        document.body.removeChild(myform);
      }

      alert(request.getParameter("title"));
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
        </div>
      </div>
    </div>


    <div class="container">
        <div class="row">
          <br>
          <br>
          <div class="col-lg-8">                     
            <div class="form-group">
              <label for="inputTitle" class="col-lg-2 control-label">Title</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="snippettitle" value="${param.title}">
              </div>
            </div>

            <div class="form-group">
              <label for="inputTags" class="col-lg-2 control-label">Tags</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="snippettag" value="${param.tags}">
              </div>
            </div>

            <div class="form-group">
              <label for="textArea" class="col-lg-2 control-label">Content</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="snippetcontent" value="${param.contents}">
              </div>
            </div>
            <div class="form-group">
              <label for="inputTags" class="col-lg-2 control-label">Snippet ID</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="snippetid" value="${param.snippetid}" readonly="readonly">
              </div>
            </div> 
            <br>
            <br>
            <div class="form-group">
        	  <div class="col-md-10">
                <button class="btn btn-md btn-success" onclick="editsnippet()">Edit</button>
              </div>
            </div>
	        
          </div>
        </div>

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

    <script type="text/javascript">
    /* <![CDATA[ */
    (function(){try{var s,a,i,j,r,c,l=document.getElementsByTagName("a"),t=document.createElement("textarea");for(i=0;l.length-i;i++){try{a=l[i].getAttribute("href");if(a&&a.indexOf("/cdn-cgi/l/email-protection") > -1  && (a.length > 28)){s='';j=27+ 1 + a.indexOf("/cdn-cgi/l/email-protection");if (a.length > j) {r=parseInt(a.substr(j,2),16);for(j+=2;a.length>j&&a.substr(j,1)!='X';j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}j+=1;s+=a.substr(j,a.length-j);}t.innerHTML=s.replace(/</g,"&lt;").replace(/>/g,"&gt;");l[i].setAttribute("href","mailto:"+t.value);}}catch(e){}}}catch(e){}})();
    /* ]]> */
    </script>
</body>
</html>
