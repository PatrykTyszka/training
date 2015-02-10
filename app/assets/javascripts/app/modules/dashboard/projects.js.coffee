Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.Project = Marionette.ItemView.extend

    tagName: 'tr'
    template: 'dashboard/project'


  Dashboard.Projects = Marionette.CompositeView.extend

    template: 'dashboard/projects'
    childView: Dashboard.Project
    childViewContainer: 'tbody'



