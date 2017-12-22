<%@page import="dao.ErroProgramaException"%>
<%@page import="control.ProgramaBean"%>
<%@page import="model.Programa"%>
<%@page import="control.SistemaOperacinalBean"%>
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
<link rel="stylesheet" href="css/TabelaPrograma.css" charset="UTF-8"/>
<link rel="stylesheet" href="css/adicionarPrograma.css" charset="UTF-8"/>
<script rel="text/script" src="js/jquery-3.2.1.js"></script>
<script rel="text/script" src="js/menuUser.js" charset="UTF-8"></script>
<script rel="text/script" src="js/menuSelecionarSO.js" charset="UTF-8"></script>
<title>Selecionar SO</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section class="sectionPrincipal">
		<article class="articlePrincipal">
			<form class="adicionar" name="adicionar" method="post" action=<%="control/adicionarPrograma.jsp?id="+request.getParameter("id")+"&S)="+request.getParameter("SO")%>>
				<label for="adicionar" id="required">Nome do SO:</label><br/>
				<select name="comboSO" id="comboSO" id="combo" required="required" onchange="change()">
					<% try{
						SistemaOperacinalBean SOB = new SistemaOperacinalBean();
						SOB.setIdMaquina(Integer.parseInt(request.getParameter("id")));
						SistemaOperacinal SO = new SistemaOperacinal(SOB);
						ArrayList<SistemaOperacinalBean> SOs=SO.buscar();
						for(int i=0; i<SOs.size();i++){%>
							<%String so=SOs.get(i).getNome();
							so=so.replaceAll(" ", "+");%>
									<option value=<%=so%>><%=SOs.get(i).getNome() %></option>
							  <%}
						   }catch(BuscarSOsException e){%>
							   <div class="alerta">
									<h1>
										<%out.println(e.getMessage());%>
									</h1>
									<a href="../index.jsp">Retornar a página de login</a>
								</div>
					   <%}%>
					</select><br>
					<label for="adicionar" id="required">Nome do programa:</label>
					<select name="comboPro" id="combo" required="required">
						<% try{
							Programa pro = new Programa();
							ArrayList<ProgramaBean> pros=pro.buscar();
							for(int i=0; i<pros.size();i++){%>
							<%String prog=pros.get(i).getNome();
							prog=prog.replaceAll(" ", "+");%>
								<option value=<%=prog%>><%=pros.get(i).getNome() %></option>
							<%}
						 }catch(SQLException|ErroProgramaException e){%>
							   <div class="alerta">
									<h1>
										<%out.println(e.getMessage());%>
									</h1>
									<a href="../index.jsp">Retornar a página de login</a>
								</div>
						 <%}%>
					</select><br>
					<table class="visualizarPrograma">
				<tr>
					<td>Nome</td>
					<td>Livre</td>
					<td>Número da licença</td>
					<td>Data de expiração</td>
				</tr>
		<% 
			try{
				Programa proDAO = new Programa();
				ArrayList<ProgramaBean> pros=proDAO.buscar();
				for(int i=0; i<pros.size();i++){
					if(!pros.get(i).isSO() && pros.get(i).getIdMaquina()==Integer.parseInt(request.getParameter("id")) && pros.get(i).getNomeSO().equals(request.getParameter("SO"))){
		%>
			 		 <tr class="dados">
						<td><%=pros.get(i).getNome()%></td>
						<td><%=pros.get(i).isLivre()%></td>
						<td><%=pros.get(i).getLicencaID()%></td>
						<td><%=pros.get(i).getData()%></td>
					</tr>
		<%
					}
				}
			}catch(SQLException|ErroProgramaException e){
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
					<button type="submit" class="btnCadastrar">Adicionar</button>
					<button type="reset" class="btnCancelar">Cancelar</button>
				</form>
		</article>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>