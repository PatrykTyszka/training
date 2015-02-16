Training.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Project = Backbone.Model.extend()

  Entities.Projects = Backbone.Collection.extend

    model: Entities.Project

    url: '/projects'

    fetchCollection: ->
      @fetch(reset: true)

