<%@page import="dao.ErroProgramaException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.Programa"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar</title>
</head>
<body>
<jsp:useBean id="proB" class="control.ProgramaBean" scope="page"/>
<jsp:setProperty name="proB" property="data" param="data"/>
<jsp:setProperty name="proB" property="nome" param="nome"/>
<jsp:setProperty name="proB" property="licencaID" param="licencaID"/>
<%
	try{
		if(request.getParameter("SO").equals("sim")){
			proB.setSO(true);
		}else{
			proB.setSO(false);			
		}
		if(request.getParameter("livre").equals("sim")){
			proB.setLivre(true);
		}else{
			proB.setLivre(false);			
		}
		Programa pro=new Programa(proB);
		pro.cadastrar();
		%>
		<div class="alerta">
			<h1>
				<%out.println("Software cadastrado com sucesso");%>
			</h1>
			<a href="../index.jsp">Retornar a página de login</a>
		</div>
	<%
	}catch(SQLException|ErroProgramaException e){%>
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