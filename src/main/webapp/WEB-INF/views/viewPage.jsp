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
	<style type="text/css">
table.ItemTable {
  font-family: Tahoma, Geneva, sans-serif;
  border: 2px solid #606B70;
  background-color: #FFFFFF;
  width: 60%;
  height: 30%;
  margin-left:20%; 
  margin-right:20%;
  text-align: center;
  border-collapse: collapse;
}
table.ItemTable td, table.ItemTable th {
  border: 1px solid #4A4A4A;
  padding: 6px 4px;
}
table.ItemTable tbody td {
  font-size: 13px;
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
		table.ItemCart {
  font-family: Tahoma, Geneva, sans-serif;
  border: 2px solid #606B70;
  background-color: #FFFFFF;
  width: 60%;
  height: 30%;
  margin-left:20%; 
  margin-right:20%;
  text-align: center;
  border-collapse: collapse;
}
table.ItemCart td, table.ItemCart th {
  border: 1px solid #4A4A4A;
  padding: 6px 4px;
}
table.ItemCart tbody td {
  font-size: 13px;
  color: #212121;
}
table.ItemCart tr:nth-child(even) {
  background: #fafafa;
}
table.ItemCart thead {
  background: #bdbdbd;
  background: -moz-linear-gradient(top, #9aacb5 0%, #859ba6 66%, #78909C 100%);
  background: -webkit-linear-gradient(top, #9aacb5 0%, #859ba6 66%, #78909C 100%);
  background: linear-gradient(to bottom, #9aacb5 0%, #859ba6 66%, #78909C 100%);
  border-bottom: 3px solid #606B70;
}
table.ItemCart thead th {
  font-size: 18px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #606B70;
}
table.ItemCart thead th:first-child {
  border-left: none;
}

table.ItemCart tfoot td {
  font-size: 12px;
}
table.ItemCart tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #00675b;
  background: -moz-linear-gradient(top, #73838b 0%, #576a73 66%, #455A64 100%);
  background: -webkit-linear-gradient(top, #73838b 0%, #576a73 66%, #455A64 100%);
  background: linear-gradient(to bottom, #73838b 0%, #576a73 66%, #455A64 100%);
}
table.ItemCart tfoot td {
  font-size: 14px;
}
#Box {
-webkit-box-shadow: 5px 5px 15px 5px rgba(38,50,56,0.83); 
box-shadow: 5px 5px 15px 5px rgba(38,50,56,0.83);
background: #FFFFFF;
}
body#tinymce {
background: #FFFFFF
}
</style>
<div id="Box">
	<br>
	<br>
	<br>
	TODAY'S MENU
	<table  class="ItemTable">
		<thead>
		<tr>
			<th>NAME OF THE ITEM</th>
			<th>COST</th>
			<th Colspan="2">QUANTITY</th>
		</tr>
		</thead>
		<tbody>
		<tr ng-repeat="x in ctrl.users">
			<td>{{x.username}}</td>
			<td>&#8377;{{x.email}}</td>
			<td><button class="btn btn-sm btn-success" ng-click="addFood(x)">Add</button></td>
			<td><button class="btn btn-sm btn-danger" ng-click="RemoveFood(x)">Reduce</button></td>
		</tr>
		</tbody>
		
	</table>
	<br>
	<div id="ItemCart">
	<div ng-show="vara">
		List

		<table class="ItemCart">
			<thead>
			<tr>
			<th>NAME OF THE ITEM</th>
			<th>QUANTITY</th>
			<th>COST</th>
			</tr>
			</thead>
			<tr ng-repeat="x in foodCart">
				<td>{{x.username}}</td>
				<td>{{x.quantity}}</td>
				<td>&#8377;{{x.email * x.quantity}}</td>
			</tr>
			<tfoot>
			<tr>
				<td colspan="2">Total Cost: </td>
				<td>&#8377;{{totalCost()}}</td>
			</tr>
			</tfooot>
		</table>
		<br>
	</div>
	</div>
	<br>
	<div>
		<button href="#" onclick="window.print()">Proceed to checkout</button>
	</div>
  <button ng-click="printDiv('ItemCart');">Print Div</button>
</div>
	</div>
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
