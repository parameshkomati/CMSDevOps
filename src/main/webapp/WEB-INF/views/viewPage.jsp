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
<style type="text/css">
table.ItemTable {
  font-family: "Tahoma", Gadget, sans-serif;
  border: 2px solid #606B70;
  background-color: #FFFFFF;
  width: 60%;
  height: 200px;
  margin-left:20%; 
  margin-right:20%;
  text-align: center;
  border-collapse: collapse;
}
table.ItemTable td, table.ItemTable th {
  border: 1px solid #4A4A4A;
  padding: 3px 2px;
}
table.ItemTable tbody td {
  font-size: 13px;
  font-weight: normal;
  color: #212121;
}
table.ItemTable tr:nth-child(even) {
  background: #ECEFF1;
}
table.ItemTable thead {
  background: #78909C;
  background: -moz-linear-gradient(top, #9aacb5 0%, #859ba6 66%, #78909C 100%);
  background: -webkit-linear-gradient(top, #9aacb5 0%, #859ba6 66%, #78909C 100%);
  background: linear-gradient(to bottom, #9aacb5 0%, #859ba6 66%, #78909C 100%);
  border-bottom: 3px solid #606B70;
}
table.ItemTable thead th {
  font-size: 18px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #606B70;
}
table.ItemTable thead th:first-child {
  border-left: none;
}

table.ItemTable tfoot td {
  font-size: 12px;
}

</style>
<body ng-app="myApp" ng-controller="UserController as ctrl">
	<br>
	<br>
	<br>
	<table  class="ItemTable">
		<thead>
		<tr>
			<th>Order Name</th>
			<th>Cost</th>
			<th colspan="2">Qty</th>
		</tr>
			</thead>
		<tbody>	
		<tr ng-repeat="x in ctrl.users">
			<td>{{x.username}}</td>
			<td>{{x.email}}</td>
			<td><button class="btn btn-sm btn-success" ng-click="addFood(x)">Add</button></td>
			<td><button class="btn btn-sm btn-danger" ng-click="RemoveFood(x)">Reduce</button></td>
		</tr>
		</tbody>
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
