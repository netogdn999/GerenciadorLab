<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="control.UsuarioBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/header.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/footer.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/principal.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/cadastroMaquina.css" charset="UTF-8"/>
<script rel="text/script" src="js/jquery-3.2.1.js"></script>
<script rel="text/script" src="js/menuUser.js" charset="UTF-8"></script>
<title>system</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section class="sectionPrincipal">
		<article class="articlePrincipal">
			<form class="cadastrar" name="cadastrar" method="post" action="control/Logar.jsp">
				<label for="cadastrar" id="required">Nome da máquina:</label><br/>
				<input name="nome" type="text" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Processador:</label><br/>
				<input name="nome" type="text" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Ram:</label><br/>
				<input name="nome" type="number" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Cache:</label><br/>
				<input name="nome" type="number" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Sistema operacional:</label><br/>
				<input name="nome" type="text" size=80 maxlength="80" required="required"/><br/>
			</form>
		</article>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>