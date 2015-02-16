Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.Layout = Marionette.LayoutView.extend

    el: 'body'

    regions:
      main: '#main'

    projectEdit: ->
      @getRegion('main').show(new Dashboard.ProjectEdit(model: @_getModel()))

    projectShow: ->
      @getRegion('main').show(new Dashboard.ProjectShow(model: @_getModel()))

    dashboard: ->
      collection = new App.Entities.Projects
      collection.fetchCollection()
      @getRegion('main').show(new Dashboard.Projects(collection: collection))

    _getModel: ->
      new Backbone.Model(gon.project)
