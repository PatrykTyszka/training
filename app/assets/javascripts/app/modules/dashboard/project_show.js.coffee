Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.ProjectShow = Marionette.ItemView.extend

    template: 'dashboard/project_show'