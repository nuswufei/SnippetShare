<html>
  <body>
    <h1>pagelist</h1>
    <h2>ownlist</h2>
	<c:forEach items="${ownList}" var="board">
		<tr>
		<td>${board.title}</td>
		</tr>
	</c:forEach>
	<h1>${count}</h1>
  </body>
</html>