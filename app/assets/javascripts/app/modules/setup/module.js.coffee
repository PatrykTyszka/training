Training.module "Setup", (Setup, App, Backbone, Marionette, $, _) ->

  App.Helpers = {
    csrfToken: ->
      csrfToken = $('meta[name=csrf-token]').attr('content')
      csrfParam = $('meta[name=csrf-param]').attr('content')
      '<input name="' + csrfParam + '" value="' + csrfToken + '" type="hidden" />'
  }
