
// app.factory('formDataObject', function() {
//     return function(data) {
//         var fd = new FormData();
//         angular.forEach(data, function(value, key) {
//             fd.append(key, value);
//         });
//         return fd;
//     };
// });

function ClientCtrl ($scope, $http) {
	$scope.examples = [{text: 'Get list of company', url: 'companies'}, {text: 'Get company with id', url: 'company/18'}];
	
	$scope.methods = [{label:'GET', value:'get'},{label:'POST', value:'post'},{label:'PUT', value:'put'},
				   		{label:'DELETE', value:'delete'}];
    

	$scope.get_post_info = function() {
		data = {};

		if ($scope.methodName.value == 'post' || $scope.methodName.value == 'put') {
			form = {};
			var fd = new FormData();
	
			fd.append('company_id', $scope.company_id);
			fd.append('name', $scope.uname);
			fd.append('address', $scope.address);
			fd.append('city', $scope.city);
			fd.append('country', $scope.country);
			fd.append('email', $scope.email);
			fd.append('phone_number', $scope.phone_number);
			file = document.getElementById('owner').files[0];
			fd.append("owner", file, file.name);
			// var oBlob = new Blob(['form'], { type: file.type});
			// fd.append("owner", oBlob, document.getElementById('owner').value);
		}
			
		$http({
		    url: $scope.curlName,
		    method: $scope.methodName.label,
		    data: fd,
		    headers: {'Content-Type': undefined},
   		    transformRequest: angular.identity

		}).success(function(data, status, headers, config) {
		    $scope.datas = data;
		}).error(function(data, status, headers, config) {
		    $scope.status = status;
		});	
	}

	$scope.changeMethod = function($event) {
		selectedMethod = $scope.methodName.value;
		if (selectedMethod == 'post' || selectedMethod == 'put') {
			$scope.show = true;
		} else if (selectedMethod == 'get' || selectedMethod == 'delete') {
			$scope.show = false;
			simpleForm.company_id.required = false;
			simpleForm.name.required = false;
			simpleForm.address.required = false;
			simpleForm.city.required = false;
			simpleForm.country.required = false;
			simpleForm.email.required = false;
			simpleForm.phone_number.required = false;
			simpleForm.owner.required = false;
		}
	}
	
}
