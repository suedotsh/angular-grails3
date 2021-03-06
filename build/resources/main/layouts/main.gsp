<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

  		<asset:stylesheet src="application.css"/>

        <asset:script type="text/javascript">
            angular.module('myApp.core.constants')
                .constant('rootUrl', '${grailsApplication.config.angular.rootUrl}')
                .constant('pageSize', '${grailsApplication.config.angular.pageSize}')
                .constant('dateFormat', '${grailsApplication.config.angular.dateFormat}');
        </asset:script>

        <asset:javascript src="application.js"/>
        <asset:deferredScripts />
		<g:layoutHead/>
	</head>
	<body id="ng-app" ng-app="${pageProperty(name: 'body.ng-app') ?: 'myApp'}">

    <div class="container-fluid">

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
        <div class="navbar-header">
            <g:link uri="/" class="navbar-brand">Angular Grails Lazybones Template</g:link>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="https://github.com/craigburke/lazybones-angular-grails"><i class="fa fa-github"></i> Github</a></li>
        </ul>
        </div>
    </nav>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
		    <div class="col-md-2">
				<div>
					<ul class="nav nav-pills nav-stacked">
		            	<li menu-item="{'home' : 'active'}"><a ui-sref="home"><i class="fa fa-home"></i> Home</a></li>
						<g:each var="c" in="${grailsApplication.controllerClasses.findAll{ !(it.logicalPropertyName in ['assets', 'home']) }. sort { it.fullName } }">
							<li menu-item="{'${c.logicalPropertyName}.*' : 'active'}"><a ui-sref="${c.logicalPropertyName}.list" ><i class="fa fa-database"></i> ${c.logicalPropertyName.capitalize()}</a></li>
						</g:each>
					</ul>
				</div>
			</div>

			<div class="col-md-10">
            	<div class="animate-view" ui-view></div>
			</div>
        </div>
      </div>
    </div>
    </div>

    </body>
</html>
