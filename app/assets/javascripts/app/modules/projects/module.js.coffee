Training.module "Project", (Project, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Project.Router = Marionette.AppRouter.extend

    appRoutes:
      'projects(/)': 'projects'

  API =
    projects: ->
      view = new Project.Layout
      App.getRegion('main').show view

  App.addInitializer ->
    Project.ModuleRouter = new Project.Router
      controller: API