angular.module('myApp').controller('MyCtrl',['$scope',function($scope){
    $scope.test= "Welcome to Script";
    $scope.vara =false;
    
      $scope.foodItems = [{
        "name" : "Briyani",
        "cost" : 100
      },{
        "name" : "Curdrice",
        "cost" : 50
      },{
        "name" : "Chappathi",
        "cost" : 70
      },{
        "name" : "Fried Rice",
        "cost" : 50
      },{
        "name" : "Egg Fried Rice",
        "cost" : 80
      }
    ];
    $scope.foodCart=[];
    $scope.addFood =function (x) {
        var flag=false,index;
        for(var i=0;i<Object.keys($scope.foodCart).length;i++){
            if($scope.foodCart[i].username.localeCompare(x.username)==0){
                 flag=true;
                 index=i;
                 break;
            }
        }
        
        if(flag){
            $scope.foodCart[index].quantity+=1;
            index = 0;
        }else{
            $scope.foodCart.push({username:x.username,email:x.email,quantity:1});
        }
        
        $scope.visible();
       

      };

      $scope.RemoveFood=function(x){
    	  var flag=false,index;
          for(var i=0;i<Object.keys($scope.foodCart).length;i++){
              if($scope.foodCart[i].name.localeCompare(x.name)==0){
                   flag=true;
                   index=i;
                   break;
              }
          }
          
          if(flag){
          	if($scope.foodCart[index].quantity >=2){
          		$scope.foodCart[index].quantity-=1;
          		index = 0;      		
          	}else{
          		console.log($scope.foodCart[index].name);
                $scope.foodCart.splice(index);
            }              
          }
        
      };	



      $scope.totalCost= function(){
        var total=0;
        for( var i=0;i<Object.keys($scope.foodCart).length;i++){
            total = total + $scope.foodCart[i].cost * $scope.foodCart[i].quantity;
        }
        return total;
      };

      $scope.visible=function(){
        console.log($scope.foodCart.length);
        if ($scope.foodCart.length>0) {
          $scope.vara=true;
        }else{
          $scope.vara=false;
        }
      };
          $scope.PrintInfo = function() {
        var innerContents = document.getElementById(Cart).innerHTML;
        var popupWinindow = window.open('', '_blank', 'width=600,height=700,scrollbars=no,menubar=no,toolbar=no,location=no,status=no,titlebar=no');
        popupWinindow.document.open();
        popupWinindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="style.css" /></head><body onload="window.print()">' + innerContents + '</html>');
        popupWinindow.document.close();
        });     
}]);
