
if Meteor.isClient

  angular.module('kurea.web').controller 'IdleFilter', ['$scope', 'IdleFilterData', ($scope, Filters) ->
    $scope.editing = statName: 'Level', stat: 'level.__current', name: '', profession: '', map: '', guild: ''

    $scope._filterData = Filters.getFilterData()

    $scope.$watch 'editing', (newVal, oldVal) ->
      return if newVal is oldVal
      $scope.editing.statName = _.findWhere($scope._filterData.stats, {key: $scope.editing.stat})?.name
      Filters.setFilters newVal
    , yes
  ]