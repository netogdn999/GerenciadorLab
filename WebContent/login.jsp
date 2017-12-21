<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/loginEstilo.css"/>
<title>login</title>
</head>
<body>
	<section class="corpo">
		<article class="loginJanela">
			<div class="form">
				<form class="login" name="login" method="post" action="control/Logar.jsp">
				<label for="login">Usuário:</label><br/>
				<input name="usuario" type="text" size="20" maxlength="20" required="required"/><br/>
				<label for="login">Senha:</label><br/>
				<input name="senha" type="password" size="20" maxlength="20" required="required"/><br/>
				<a class="linkCadastrar" href="cadastroU.jsp">Cadastrar novo usuário</a>
				<button class="btnLogar">Logar</button>
				</form>
			</div>
		</article>
	</section>
</body>
</html>