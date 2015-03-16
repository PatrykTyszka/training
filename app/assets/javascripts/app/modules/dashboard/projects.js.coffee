Training.module "Dashboard", (Dashboard, App, Backbone, Marionette, $, _) ->

  @startWithParent = false

  Dashboard.EmptyDashaboardView = Marionette.ItemView.extend

    template: 'dashboard/empty_dashboard'

  Dashboard.Project = Marionette.ItemView.extend

    tagName: 'tr'
    template: 'dashboard/project'

    ui:
      projectDestroy: 'a.destroy'

    events:
      'click @ui.projectDestroy': 'projectDestroy'

    projectDestroy: ->
      @model.destroy()

  Dashboard.Projects = Marionette.CompositeView.extend

    template: 'dashboard/projects'
    childView: Dashboard.Project
    childViewContainer: 'tbody'
    emptyView: Dashboard.EmptyDashaboardView

    ui:
      projectNew: 'a.new'
      td: 'td'
      loadMore: '[href="#load_more"]'

    events:
      'click @ui.projectNew': 'projectNew'

    triggers:
      'click @ui.loadMore': 'next:page'

    onShow: ->
      if @collection.onePage()
        @ui.loadMore.hide()

    onNextPage: ->
      collection = @collection
      collection.fetch
        data:
          page: collection.page+1
        remove: false
        success: =>
          if @collection.lastPage()
            @ui.loadMore.hide()

    projectNew: ->
      model = new App.Entities.Project
      model.save null,
        success: =>
          view = new Dashboard.Project(model: model)
          @collection.add model
          @bindUIElements()





