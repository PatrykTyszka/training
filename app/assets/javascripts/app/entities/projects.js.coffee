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

    parse: (data) ->
      @totalPages = data.total_pages
      @perPage = data.limit_value
      @page = data.current_page
      data.projects

    onePage: ->
      +@totalPages <= 1

    lastPage: ->
      +@page == +@totalPages