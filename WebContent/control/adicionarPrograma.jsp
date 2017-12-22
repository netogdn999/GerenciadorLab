<%@page import="model.Programa"%>
<%@page import="dao.ErroProgramaException"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Programa</title>
</head>
<body>
<jsp:useBean id="proB" class="control.ProgramaBean" scope="page"/>
<jsp:setProperty name="proB" property="nomeSO" param="comboPro"/>
<jsp:setProperty name="proB" property="nome" param="comboSO"/>
<%
	try{
		System.out.println(proB.getNome());
		System.out.println(proB.getNomeSO());
		proB.setIdMaquina(Integer.parseInt(request.getParameter("id")));
		proB.setNome(proB.getNome().replaceAll("\\+", " "));
		proB.setNomeSO(proB.getNomeSO().replaceAll("\\+", " "));
		proB.setLivre(true);
		Programa pro=new Programa(proB);
		pro.adicionar();
		response.sendRedirect("selecionarSO.jsp?id="+request.getParameter("id")+"&SO="+request.getParameter("SO"));
	}catch(SQLException|ErroProgramaException e){%>
		<div class="alerta">
			<h1>
				<%out.println(e.getMessage());%>
			</h1>
			<a href="../index.jsp">Retornar a página de login</a>
		</div>
	<%}%>
%>
</body>
</html>