Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.Router = Marionette.AppRouter.extend

    appRoutes:
      'dashboard(/)': 'dashboard'
      'projects/:id(/)': 'projectShow'

  API =
    projectShow: ->
      view = new Dashboard.Layout
      view.projectShow()

    dashboard: ->
      view = new Dashboard.Layout
      view.dashboard()

  App.addInitializer ->
    Dashboard.ModuleRouter = new Dashboard.Router
      controller: API