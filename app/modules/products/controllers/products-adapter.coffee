angular.module('pedidosApp').controller 'ProductsAdapter',
  ($http) ->

    retrieveCategories = () ->
      $http.get( '/be/productsCategories.php').then (response) ->
        {
          success: true
          data: response
        }
      .catch (error) ->
        console.log error
        {
          success: false
          data: error
        }



    getCategories: retrieveCategories
