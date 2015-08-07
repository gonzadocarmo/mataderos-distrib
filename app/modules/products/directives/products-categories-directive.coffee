angular.module('pedidosApp').directive 'prodGetCategories',
(ProductsService) ->
  restrict: 'E'
  scope: {}
  templateUrl: ''

  link: ($scope, ele, attrs, ctrl) ->
    ProductsService.getCategories().then (response) ->
      $scope.categories = response
