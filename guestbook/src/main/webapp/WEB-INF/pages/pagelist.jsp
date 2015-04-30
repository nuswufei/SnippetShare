<html>
  <body>
    <h1>pagelist</h1>
    <h1>ownlist</h1>
	<c:forEach items="${ownList}" var="board">
		<tr>
		<td>${board.title}</td>
		</tr>
	</c:forEach>
	<h1>${count}</h1>
  </body>
</html>