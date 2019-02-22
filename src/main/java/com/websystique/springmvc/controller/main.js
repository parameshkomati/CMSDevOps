

var app = angular.module("myapp",[])
app.controller('MyCtrl',['$scope',function($scope){
    $scope.test= "Welcome to Script";
    $scope.var =false;
    
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
    ]
    $scope.foodCart=[]
    $scope.addFood =function (x) {
        var flag=false,index;
        for(var i=0;i<Object.keys($scope.foodCart).length;i++){
            if($scope.foodCart[i].name.localeCompare(x.name)==0){
                 flag=true;
                 index=i;
                 break;
            }
        }
        
        if(flag){
            $scope.foodCart[index].quantity+=1;
        }else{
            $scope.foodCart.push({name:x.name,cost:x.cost,quantity:1});
        }
        
        $scope.visible();
        console.clear();
        $scope.foodCart.forEach(function(item)  {
          console.log(item.name+" "+item.cost+" "+item.quantity)
        });

      }

      $scope.RemoveFood=function(x){
        if ($scope.foodCart.length>0) {
          console.log(Object.keys($scope.foodCart[0]).indexOf(x.name))
        }
        
      }



      $scope.totalCost= function(){
        var total=0;
        for( var i=0;i<Object.keys($scope.foodCart).length;i++){
            total = total + $scope.foodCart[i].cost * $scope.foodCart[i].quantity;
        }
        return total;
      }

      $scope.visible=function(){
        console.log($scope.foodCart.length)
        if ($scope.foodCart.length>0) {
          $scope.var=true;
        }else{
          $scope.var=false;
        }
      }

     
}]);