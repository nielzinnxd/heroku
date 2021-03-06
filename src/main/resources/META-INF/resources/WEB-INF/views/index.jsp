<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>C H A T  -  A P P   - DNL™</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<fieldset>
	
	<div class="panel panel-success">
            <div class="panel-heading">
              <h3 class="panel-title">CHAT</h3>
            </div>
            <div class="panel-body">
             <div id="mensagens"></div>
            </div>
         </div>
	
</fieldset>
<br>
<div>
	Usuário: <input type="text" id="user">
	Texto: <input type="text" id="text">
	<button onclick="enviar()">Enviar</button>
</div>

<script src="js/jquery-3.0.0.min.js"></script>
<script>
	function poll() {
		$.ajax({ 
			type: "GET",
			cache: false,
			url: "polling",
			success: function(mensagem) {
				if(mensagem.text != null)
					$("#mensagens").append(mensagem.text + "<br>");
				
				poll();
			},
			error: function(err) { 
				poll();
			}
		});
	};
	poll();
	
	function enviar() {
		$.ajax({ 
			type: "POST",
			cache: false,
			contentType: "application/json",
			url: "polling",
			data: JSON.stringify({ "text" : $("#user").val() + ": "+ $("#text").val() })
		});
		$("#user").prop( "disabled", true );
	}
	
</script>
</body>
</html>
