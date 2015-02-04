Training.module "Pages", (Pages, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Pages.Layout = Marionette.LayoutView.extend

    template: 'pages/home'

