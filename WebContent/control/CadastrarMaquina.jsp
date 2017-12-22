<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.Maquina"%>
<%@ page import="model.ErroMaquinaException"%>
<%@ page import="model.campoInvalidoException"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="maqB" class="control.MaquinaBean" scope="page"/>
<jsp:setProperty name="maqB" property="idMaquina" param="idMaquina"/>
<jsp:setProperty name="maqB" property="processador" param="processador"/>
<jsp:setProperty name="maqB" property="ram" param="ram"/>
<jsp:setProperty name="maqB" property="cache" param="cache"/>
<jsp:setProperty name="maqB" property="nomeSO" param="nomeSO"/>
<%
	try{
		Maquina maq=new Maquina(maqB);
		maq.cadastrar();
		%>
		<div class="alerta">
			<h1>
				<%out.println("Máquina cadastrada com sucesso");%>
			</h1>
			<a href="../index.jsp">Retornar a página principal</a>
		</div>
	<%
	}catch(SQLException|ErroMaquinaException e){%>
		<div class="alerta">
			<h1>
				<%out.println(e.getMessage());%>
			</h1>
			<a href="../index.jsp">Retornar a página de login</a>
		</div>
 <%}
%>
</body>
</html>