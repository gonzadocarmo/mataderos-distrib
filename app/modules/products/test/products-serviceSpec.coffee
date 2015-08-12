describe 'Products Service', ->

  data =
    id: 1
    desc: "category"
    ,
    id: 2
    desc: "alalala"

  beforeEach ->
    module 'pedidosApp'

  beforeEach ->
    module ($provide) ->
      $provide.value 'ProductsAdapter',
        getCategories: () ->
          {then: (callback) -> callback(data)}
      return null

  ProductsAdapterMock = ProductsService = retrieveCategoriesSpy = undefined

  beforeEach ->
    inject ($injector) ->
      ProductsAdapterMock = $injector.get 'ProductsAdapter'
      ProductsService = $injector.get 'ProductsService'
      retrieveCategoriesSpy = spyOn(ProductsAdapterMock, 'getCategories').and.callThrough();


  describe 'getCategories', ->

    it 'should call controller and get value', ->

      result = ProductsService.getCategories()

      expect(retrieveCategoriesSpy).toHaveBeenCalled()
      expect(result).toEqual data
