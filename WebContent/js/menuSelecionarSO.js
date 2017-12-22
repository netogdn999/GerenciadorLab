$(document).ready(function() {
	change=function(){
		var link = window.location.href;
		var index=document.getElementById("comboSO").selectedIndex;
		var aux =document.getElementById("comboSO").options[index].innerText;
		var aux=aux.replace(" ","+");
		window.location.href = link+'&SO='+aux;
		document.getElementById("comboSO").options[index].selected=true;
	}
});