Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.Layout = Marionette.LayoutView.extend

    el: 'body'

    regions:
      main: '#main'

    projectShow: ->
      model = new Backbone.Model(gon.project)
      @getRegion('main').show(new Dashboard.ProjectShow(model: model))

    dashboard: ->
      collection = new App.Entities.Projects
      collection.fetchCollection()
      @getRegion('main').show(new Dashboard.Projects(collection: collection))

