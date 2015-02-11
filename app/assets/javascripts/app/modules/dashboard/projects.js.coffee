Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.Project = Marionette.ItemView.extend

    tagName: 'tr'
    template: 'dashboard/project'

    ui:
      projectDestroy: 'a.destroy'

    events:
      'click @ui.projectDestroy': 'projectDestroy'

    initialize: ->
      @listenTo(@model, 'destroy', @remove)

    projectDestroy: ->
      @model.destroy()



  Dashboard.Projects = Marionette.CompositeView.extend

    template: 'dashboard/projects'
    childView: Dashboard.Project
    childViewContainer: 'tbody'





