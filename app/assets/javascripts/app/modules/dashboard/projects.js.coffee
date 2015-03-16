Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.Project = Marionette.ItemView.extend

    tagName: 'tr'
    template: 'dashboard/project'

    ui:
      projectDestroy: 'a.destroy'

    events:
      'click @ui.projectDestroy': 'projectDestroy'

    projectDestroy: ->
      @model.destroy

  Dashboard.Projects = Marionette.CompositeView.extend

    template: 'dashboard/projects'
    childView: Dashboard.Project
    childViewContainer: 'tbody'

    ui:
      projectNew: 'a.new'
      td: 'td'

    events:
      'click @ui.projectNew': 'projectNew'

    projectNew: ->
      model = new App.Entities.Project
      model.save null,
        success: =>
          view = new Dashboard.Project(model: model)
          @collection.add model
          @bindUIElements()





