<html>
  <body>
    <h1>signup</h1>
  </body>
 <c:if test="${not empty errorMessage}"> 
<font color="red"> 
Signup error. <br /> 
Reason : ${errorMessage} 
</font>
</c:if>
</html>