'use strict'

# jasmine specs for controllers go here

# TODO figure out how to test Controllers that use modules
describe "controllers", ->
  beforeEach angular.module "app.controllers"

  describe "AppCtrl", ->

    it "should exist", inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      ctrl = $controller "AppCtrl",
        $scope: scope,
      expect(scope.onePlusOne).toEqual(2)
