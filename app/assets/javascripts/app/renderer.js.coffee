do (Marionette) ->
  _.extend Marionette.Renderer,

    render: (template, data) ->
      path = @getTemplate(template)
      throw "Template #{template} not found!" unless path
      path(data)

    getTemplate: (template) ->
      return JST["templates/#{template}"]