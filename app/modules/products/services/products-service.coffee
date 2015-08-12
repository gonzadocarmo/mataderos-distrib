angular.module('pedidosApp').service 'ProductsService',
  (ProductsAdapter) ->

    callGetCategories = () ->
      ProductsAdapter.getCategories().then (response) ->
        response


    getCategories: callGetCategories
