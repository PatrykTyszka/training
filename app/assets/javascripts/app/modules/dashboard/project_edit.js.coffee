Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.ProjectEdit = Marionette.ItemView.extend

    template: 'dashboard/project_edit'

    initialize: ->
      console.log @model