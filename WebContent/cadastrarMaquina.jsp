<%@page import="model.BuscarSOsException"%>
<%@page import="model.SistemaOperacinal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SistemaOperacionalDAO"%>
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
			<form class="cadastrar" name="cadastrar" method="post" action="control/CadastrarMaquina.jsp">
				<label for="cadastrar" id="required">Num. da m�quina:</label><br/>
				<input name="idMaquina" type="number" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Processador:</label><br/>
				<input name="processador" type="text" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Ram:</label><br/>
				<input name="ram" type="text" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Cache:</label><br/>
				<input name="cache" type="text" size=80 maxlength="80" required="required"/><br/>
				<label for="cadastrar" id="required">Sistema Operacional:</label><br/>
				<select name="nomeSO" class="combo" required="required">
				<% try{
						SistemaOperacionalDAO SODAO=new SistemaOperacionalDAO();
						ArrayList<SistemaOperacinal> SOs=SODAO.buscar();
						for(int i=0; i<SOs.size();i++){%>
							<option><%=SOs.get(i).getNome()%></option>
					  <%}
				   }catch(BuscarSOsException e){%>
					   <div class="alerta">
							<h1>
								<%out.println(e.getMessage());%>
							</h1>
							<a href="../index.jsp">Retornar a p�gina de login</a>
						</div>
				   <%}%>
				</select><br>
				<button type="submit" class="btnCadastrar">Cadastrar</button>
				<button type="reset" class="btnCancelar">Cancelar</button>
			</form>
		</article>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>