
###*
# @ngdoc overview
# @name pedidosApp
# @description
# # pedidosApp
#
# Main module of the application.
###

angular.module('pedidosApp', [
  'ngAnimate'
  'ngCookies'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngTouch'
  'ui.router'
  'ionic'
  'products'
  'cart'
])

angular.module 'products', ['ngRoute']
angular.module 'cart', ['ngRoute']

angular.module('pedidosApp').run ($ionicPlatform, $state) ->
  $ionicPlatform.ready ->
    StatusBar.styleDefault() if window.StatusBar
    $state.go 'app.menu'

angular.module('pedidosApp').config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state 'app',
    url: '/app'
    abstract: true
    templateUrl: 'modules/base/views/layout.html'

  .state 'app.menu',
    url: '/menu'
    views:
      navContent:
        templateUrl: 'modules/products/views/categories.html'

  .state 'app.cart',
    url: '/cart'
    views:
      navContent:
        templateUrl: 'modules/products/views/categories.html'

  $urlRouterProvider.otherwise '/menu'
