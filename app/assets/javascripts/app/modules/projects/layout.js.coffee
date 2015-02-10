Training.module "Project", (Project, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Project.Layout = Marionette.LayoutView.extend

    template: 'projects/index'

