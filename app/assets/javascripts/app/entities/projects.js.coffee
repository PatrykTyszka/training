Training.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Project = Backbone.Model.extend

    urlRoot: 'projects'

    defaults:
      name: 'unknown'
      level: 'unknown'
      status: 'inprogress'
      id: null

  Entities.Projects = Backbone.Collection.extend

    model: Entities.Project

    url: '/projects'

    fetchCollection: ->
      @fetch(reset: true)

