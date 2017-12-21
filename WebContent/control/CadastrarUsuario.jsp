<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario"%>
<%@ page import="model.CadastroUsuarioException"%>
<%@ page import="model.campoInvalidoException"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="userB" class="control.UsuarioBean" scope="page"/>
<jsp:setProperty name="userB" property="usuario" param="usuario"/>
<jsp:setProperty name="userB" property="senha" param="senha"/>
<%
	try{
		Usuario user=new Usuario(userB);
		user.cadastrar();
	%>
		<div class="alerta">
			<h1>
				<%out.println("Usuário cadastrado com sucesso");%>
			</h1>
			<a href="../login.jsp">Retornar a página de login</a>
		</div>
	<%
	}catch(SQLException|CadastroUsuarioException|campoInvalidoException e){%>
		<div class="alerta">
			<h1>
				<%out.println(e.getMessage());%>
			</h1>
			<a href="../login.jsp">Retornar a página de login</a>
		</div>
	<%}
%>
</body>
</html>