LMS.SignUpController = Ember.ObjectController.extend

  needs: ['currentUser']

  errors: null
  isSaving: false

  isEmailValid: (->
    LMS.EmailValidator.isValid(@get('email'))
  ).property('email')

  isPasswordLongEnough: (->
    @get('password')?.length >= 5
  ).property('password')

  isPasswordConfirmed: (->
    @get('password') == @get('passwordConfirmation')
  ).property('password', 'passwordConfirmation')

  isValid: Ember.computed.and('name', 'isEmailValid', 'isPasswordLongEnough', 'isPasswordConfirmed')
  isInvalid: Ember.computed.not('isValid')
  isDisabled: Ember.computed.or('isInvalid', 'isSaving')

  emailDidChange: (->
    @set('errors', null)
  ).observes('email')

  actions:
    signIn: ->
      @set('isSaving', true)
      user = @get('model')

      $.ajax('/users', {
        type: 'POST'
        data:
          user:
            name: user.get('name')
            email: user.get('email')
            password: user.get('password')
            password_confirmation: user.get('passwordConfirmation')
        dataType: 'json'
      }).done((response) =>
        @get('store').adapterForType(LMS.User).didFindRecord(@get('store'), LMS.User, response)
        user = LMS.User.find(response.user.id)
        @get('controllers.currentUser').set('content', user)
        @transitionToRoute('index')
      ).fail((response) =>
        @set('errors', @_parseErrors(response.responseJSON.errors))
      ).always( =>
        @set('isSaving', false)
      )

    cancel: ->
      @transitionToRoute('index')

  _parseErrors: (errorsObj) ->
    errors = []
    for key, value of errorsObj
      errors.push("#{key} #{value[0]}")
    errors
