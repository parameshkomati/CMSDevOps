'use strict';

angular.module('myApp').controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
    var self = this;
    self.user={id:null,username:'',address:'',email:''};
    self.users=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllUsers();

    function fetchAllUsers(){
        UserService.fetchAllUsers()
            .then(
            function(d) {
                self.users = d;
            },
            function(errResponse){
                console.error('Error while fetching Users');
            }
        );
    }

    function createUser(user){
        UserService.createUser(user)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while creating User');
            }
        );
    }

    function updateUser(user, id){
        UserService.updateUser(user, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }

    function deleteUser(id){
        UserService.deleteUser(id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while deleting User');
            }
        );
    }

    function submit() {
        if(self.user.id===null){
            console.log('Saving New User', self.user);
            createUser(self.user);
        }else{
            updateUser(self.user, self.user.id);
            console.log('User updated with id ', self.user.id);
        }
        reset();
    }

    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i < self.users.length; i++){
            if(self.users[i].id === id) {
                self.user = angular.copy(self.users[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('id to be deleted', id);
        if(self.user.id === id) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteUser(id);
    }


    function reset(){
        self.user={id:null,username:'',address:'',email:''};
        $scope.myForm.$setPristine(); //reset Form
    }
    
    
    
    $scope.foodCart=[];
    $scope.addFood =function (x) {
        var flag=false,index;
        console.log(x.username)
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
        console.log($scope.foodCart.username)
        
        $scope.visible();
       

      };
      
      $scope.visible=function(){
          console.log($scope.foodCart.length);
          if ($scope.foodCart.length>0) {
            $scope.vara=true;
          }else{
            $scope.vara=false;
          }
        };
        
        $scope.totalCost= function(){
            var total=0;
            for( var i=0;i<Object.keys($scope.foodCart).length;i++){
                total = total + $scope.foodCart[i].email * $scope.foodCart[i].quantity;
            }
            return total;
          };
          
          $scope.RemoveFood=function(x){
        	  var flag=false,index;
              for(var i=0;i<Object.keys($scope.foodCart).length;i++){
                  if($scope.foodCart[i].username.localeCompare(x.username)==0){
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
              		console.log($scope.foodCart[index].username);
                    $scope.foodCart.splice(index);
                }              
              }
            
          };	

}]);
