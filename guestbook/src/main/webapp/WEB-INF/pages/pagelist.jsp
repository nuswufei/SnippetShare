<html>
  <body>
    <h1>pagelist</h1>
    <h2>ownlist</h2>
    <c:if test="${not empty lists}">
 
		<ul>
			<c:forEach var="listValue" items="${ownList}">
				<li>${listValue.title}</li>
			</c:forEach>
		</ul>
 
	</c:if>
  </body>
</html>