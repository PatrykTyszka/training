Training.module "Pages", (Pages, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Pages.Router = Marionette.AppRouter.extend

    appRoutes:
      '(/)': 'homePage'

  API =
    homePage: ->
      view = new Pages.Layout
      App.getRegion('main').show view

  App.addInitializer ->
    Pages.ModuleRouter = new Pages.Router
      controller: API