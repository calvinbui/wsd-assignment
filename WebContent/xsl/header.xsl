<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:variable name="context-path" select="'/wsdassignment'"/>

	<xsl:template name="navbar">
		<html>
			<head>
				<!-- Import bootstrap flatly theme -->
				<link rel="stylesheet" href="{$context-path}/css/bootstrap/bootstrap.min.css"></link>
				<script src="{$context-path}/js/bootstrap/bootstrap.min.js"></script>
				<script src="{$context-path}/js/jquery/jquery-1.11.1.min.js"></script>
				<!-- Link Font Awesome stylsheet -->
				<link href="{$context-path}/css/font-awesome/font-awesome.min.css" rel="stylesheet"></link>
				<link rel="stylesheet" href="{$context-path}/css/jquery-ui/jquery-ui.min.css"></link>
				<link rel="stylesheet" href="{$context-path}/css/jquery-ui/jquery-ui.structure.min.css"></link>
				<link rel="stylesheet" href="{$context-path}/css/jquery-ui/jquery-ui.theme.min.css"></link>
				<script src="{$context-path}/js/jquery-ui/jquery-ui.min.js"></script>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
				
			</head>
			
			<body id="navbar" data-contextpath="{$context-path}">
				<!-- Vehicle page navigation -->
				<div class="navbar navbar-default navbar-static-top" role="navigation">
				
					<!-- Navigation bar content margin -->
					<div class="container">
						<div class="navbar-header">
							<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<!-- Vehicle log book system name -->
							<span class="navbar-brand">Vehicle Log Book</span>
						</div>
						<div class="navbar-collapse collapse" id="navbar-main">
							<ul class="nav navbar-nav">
								<li><a href="{$context-path}/index.jsp" class="vehicles">Vehicles</a></li>
								<li><a href="{$context-path}/log.jsp" class="logs">Logs</a></li>
								<li><a href="{$context-path}/user.jsp" class="drivers">Drivers</a></li>
							</ul> 
							
							<!-- Login navbar -->
							<form class="navbar-form navbar-right">
									<input type="text" class="form-control input-sm" placeholder="Email"></input>
									<input type="password" class="form-control input-sm" placeholder="Password"></input>
									<button type="button" class="btn btn-primary btn-success btn-sm">Login</button>
							<!-- End of login navbar -->
							</form>
							
						</div> 
					</div>
				<!-- End of page navigation bar -->
				</div> 
			</body>
		</html>
		
		<script>				
			var contextpath = $('body').data("contextpath");
			var path = location.pathname;
			console.log('url ' + path);
			$('li a[href$="'+ path+'"]').parent().addClass('active');
			
			// if path contians '/vehicles/'
			// else path contians '/logs/' or logs.jsp
			// else path conatins '/drivers/' or driver.jsp
			
			// $(li > a).removeClass("active")	
			//$("a.vehicles").addClass("active");
				
		</script>
	</xsl:template>

</xsl:stylesheet>