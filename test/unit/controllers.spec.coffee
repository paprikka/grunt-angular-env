'use strict'

# jasmine specs for controllers go here

# TODO figure out how to test Controllers that use modules
describe "controllers", ->
  it "can be loaded via DI", ->
    expect(typeof angular.mock.module).toBe 'function'
  beforeEach angular.mock.module "app.controllers"
  scope = rootScope = {}
  describe "AppCtrl", ->
    it 'should have working scope', inject ($controller)->
      ctrl = $controller 'AppCtrl', $scope:scope
      expect(scope.test).toBe 'ok'      

    it 'should have access to rootScope', inject ($controller)->
      ctrl = $controller 'AppCtrl', $scope:scope
      expect(scope.rootScopeVar).toBe 'bar'      
