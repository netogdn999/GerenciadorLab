<%@page import="model.ErroMaquinaException"%>
<%@page import="control.MaquinaBean"%>
<%@page import="dao.MaquinaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.SistemaOperacinal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SistemaOperacionalDAO"%>
<%@ page import="model.BuscarSOsException"%>
<%@ page import="model.campoInvalidoException"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/header.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/footer.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/principal.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/TabelaMaquina.css" charset="UTF-8"/>
<script rel="text/script" src="js/jquery-3.2.1.js"></script>
<script rel="text/script" src="js/menuUser.js" charset="UTF-8"></script>
<title>Visualizar Maquinas</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section class="sectionPrincipal">
		<article class="articlePrincipal">
			<table class="visualizarMaquina">
				<tr>
					<td>Num. da propriedade</td>
					<td>Processador</td>
					<td>Memória RAM</td>
					<td>Memória cache</td>
					<td>Sistema operacional</td>
					<td>Selecionar</td>
					<td>Visualizar</td>
				</tr>
		<% 
			try{
				MaquinaDAO maquinaDAO = new MaquinaDAO();
				ArrayList<MaquinaBean> maquinas=maquinaDAO.buscar();
				for(int i=0; i<maquinas.size();i++){
		%>
			 		 <tr class="dados">
						<td><%=maquinas.get(i).getIdMaquina()%></td>
						<td><%=maquinas.get(i).getProcessador()%></td>
						<td><%=maquinas.get(i).getRam()%></td>
						<td><%=maquinas.get(i).getCache()%></td>
						<td><%=maquinas.get(i).getNomeSO()%></td>
						<%String so=maquinas.get(i).getNomeSO();
						so=so.replaceAll(" ", "+");%>
						<td><a id="add" href=<%="selecionarSO.jsp?id="+maquinas.get(i).getIdMaquina()+"&SO="+so%>><button class='selecionar'><img src='imagens/selecionar.png'></button></a></td>
						<td><button class='excluir' name='"+fornecedorB.getId()+"'><a href='jsp/excluirFornecedor.jsp'><img src='imagens/excluir.png'></a></button></td>
					</tr>
		<%
				}
			}catch(SQLException|BuscarSOsException e){
				%>
				<div class="alerta">
					<h1>
						<%out.println(e.getMessage());%>
					</h1>
					<a href="../index.jsp">Retornar a página de login</a>
				</div>
		 	<%
			}
		%>
			</table>
		</article>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>