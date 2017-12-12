app.controller("mycontroller_Wall",function($scope,$http){
	$scope.myjson={};
	$scope.myjson.id=$scope.id;
	$http.post("GetUserWall",$scope.myjson).then(function(response){
		$scope.mylist=response.data.mylist;
	},function(error)
	{
		
	});
	$scope.refresh=function()
	{
		window.location.reload();
	}
});