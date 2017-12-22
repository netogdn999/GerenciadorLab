<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/header.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/footer.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/principal.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/cadastroSoftware.css" charset="UTF-8"/>
<script rel="text/script" src="js/jquery-3.2.1.js"></script>
<script rel="text/script" src="js/menuUser.js" charset="UTF-8"></script>
<script rel="text/script" src="js/menuSoftware.js" charset="UTF-8"></script>
<title>System</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section class="sectionPrincipal">
		<article class="articlePrincipal">
			<form class="cadastrar" name="cadastrar" method="post" action="control/CadastrarSoftware.jsp">
			<label for="cadastrar" id="required">Nome do software:</label><br/>
			<input name="nome" type="text" size="80" maxlength="80" required="required"/><br/>
			<input name="SO" class="radio1" type="radio" value="sim">Sistema Operacional</input>
			<input name="SO" class="radio2" type="radio" value="nao">Não é Sistema Operacional</input><br/>
			<input id="radio3" name="livre" class="radio3" type="radio" value="sim">Software livre</input>
			<input id="radio4" name="livre" class="radio4" type="radio" value="nao">Não é Software livre</input><br/>
			<label for="cadastrar" class="ocultar" id="required">Data final da licença:</label><br/>
			<input name="data" class="ocultar" type="date"/><br/>
			<label for="cadastrar" class="ocultar" id="required">Num da lincença:</label><br/>
			<input name="licencaID"type="number" class="ocultar" size="80" maxlength="80"/><br/>
			<button type="submit" class="btnCadastrar">Cadastrar</button>
			<button type="reset" class="btnCancelar">Cancelar</button>
			</form>
		</article>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>