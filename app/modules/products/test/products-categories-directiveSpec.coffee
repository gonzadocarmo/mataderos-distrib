describe 'Products Categories Directive', ->

  beforeEach ->
    module 'ionic'
    module 'pedidosApp'

  beforeEach ->
    module ($provide) ->
      $provide.value 'ProductsService',
        getCategories: () ->
          {then: (callback) -> callback({data:"gon"})}
      return null

  ProductsServiceMock = $scope = element = isolatedScope = getCategoriesSpy = undefined

  beforeEach ->
    inject ($injector, $rootScope, $compile) ->
      ProductsServiceMock = $injector.get 'ProductsService'
      $scope = $rootScope
      getCategoriesSpy = spyOn(ProductsServiceMock, 'getCategories').and.callThrough()
      element = angular.element '<prod-get-categories></prod-get-categories>'
      $compile(element)($rootScope)
      $scope.$digest()
      isolatedScope = element.isolateScope()


  describe 'init', ->

    it 'should call service and assign value to scope', ->
      expect(getCategoriesSpy).toHaveBeenCalled()
      expect(isolatedScope.categories).toEqual {data:"gon"}
