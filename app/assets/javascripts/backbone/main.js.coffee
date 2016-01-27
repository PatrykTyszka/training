$ do ->
  _.extend Backbone.View.prototype,

    render: ->
      @getTemplate()
      return @

    getTemplate: ->
      if @template
        path = JST["backbone/templates/#{@template}"]
        throw "Template #{template} not found!" unless path
        @$el.html(path(@model.toJSON()));

  Task = Backbone.Model.extend

    defaults:
      done: false

    initialize: ->
      @listenTo @, 'remove', ->
        @destroy()

    # TODO add todo_id to collection
    url: ->
      "/todos/#{@get('todo_id')}/tasks/#{@id}"

    toggle: ->
      @set('done', !@get('done'))

  Tasks = Backbone.Collection.extend
    model: Task

  TaskItemView = Backbone.View.extend
    tagName: 'li'
    template: 'task'

    events:
      'click #task': 'toggleDone'

    toggleDone: ->
      @model.toggle()
      @$el.toggleClass('done')

  TaskCollectionView = Backbone.View.extend
    el: $('#todo_list')

    initialize: (options) ->
      @parent = options.todo
      @collection = options.collection
      @collection.todo_id = @parent.id

      @listenTo @collection, 'change', =>
        @trigger 'toggle:clear:button'

    render: ->
      @$el.append()
      @collection.each (task) =>
        @addTaskToCollectionView(task)

    clearDoneTasks: ->
      @collection.remove @collection.where(done: true)
      @$el.children().remove()
      @render()

    addTaskToCollectionView: (task) ->
      view = new TaskItemView model: task
      @$el.append(view.render().el);


    addTask: (description, todo_id) ->
      task = new Task
        description: description
        todo_id: todo_id

      task.save null,
        url: "/todos/"+todo_id+"/tasks"
        success: (task) =>
          @collection.add task
          @addTaskToCollectionView(task)
          @trigger 'add'
          # @clearInput()
        error: (xhr, data) =>
          # TODO add validation on TASKs ( desc uniq )
          console.log 'error'


  Todo = Backbone.Model.extend

    parse: (data) ->
      data.tasks = new Tasks data.tasks
      data

  TodoView = Backbone.View.extend
    el: $('#todoapp')

    events:
      'keypress #new-todo': 'createOnEnter'
      'click #clear': 'clearDoneTasks'

    initialize: ->
      @todo = new Todo gon.todo, parse: true
      @input = $('#new-todo')
      @errors = $('#errors')
      @clear = $('#clear')

      @tasksView = new TaskCollectionView
        collection: @todo.get('tasks')
        todo: @todo

      @listenTo @tasksView, 'add', @clearInput
      @listenTo @tasksView, 'toggle:clear:button', @toggleClearButton

      @tasksView.render()

    clearInput: ->
      @input.val('')

    addError: (text) ->
      @errors.append("<p>"+text+"</p>")

    clearErrors: ->
      @errors.children().remove()

    createOnEnter: (e) ->
      return if e.keyCode != 13
      unless @input.val()
        @addError('You can not add empty task!')
        return
      @clearErrors()
      @tasksView.addTask(@input.val(), @todo.id)

    toggleClearButton: ->
      if @tasksView.collection.findWhere(done: true)
        @clear.removeClass('hidden')
      else
        @clear.addClass('hidden')

    clearDoneTasks: ->
      @tasksView.clearDoneTasks()

  todoView = new TodoView
