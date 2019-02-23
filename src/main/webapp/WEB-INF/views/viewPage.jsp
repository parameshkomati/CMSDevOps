<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title>Employee Menu</title>
</head>
<body ng-app="myApp" ng-controller="UserController as ctrl">
	<br>
	<br>
	<br>
	<table  class="table table-bordered table-condenced">
		<tr>
			<td>Order Name</td>
			<td>Cost</td>
		</tr>
		<tr ng-repeat="x in ctrl.users">
			<td>{{x.username}}</td>
			<td>{{x.email}}</td>
			<td><button class="btn btn-sm btn-success" ng-click="addFood(x)">Add</button></td>
			<td><button class="btn btn-sm btn-danger" ng-click="RemoveFood(x)">Reduce</button></td>
			<td></td>
		</tr>
	</table>
	<br>
<div id="Cart">
	<div ng-show="vara">
		List
		<table class="table table-bordered table-condenced">
			<tr>
				<td>Name</td>
				<td>Quantity</td>
				<td>Cost</td>
			</tr>
			<tr ng-repeat="x in foodCart">
				<td>{{x.username}}</td>
				<td>{{x.quantity}}</td>
				<td>{{x.email * x.quantity}}</td>
			</tr>
		</table>
		<br>
		<div>Total Cost: {{totalCost()}}</div>
	</div>
	<br>
	<div>
	</div><a href="#" onclick="window.print(Cart)">Proceed to checkout</a>
	</div>


</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/service/user_service.js' />"></script>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<script src="<c:url value='/static/js/controller/main.js' />"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
</html>
