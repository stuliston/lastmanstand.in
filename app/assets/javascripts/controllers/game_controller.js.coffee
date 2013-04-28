LMS.GameController = Ember.ObjectController.extend

  needs: ['application']

  avatarUrl:(->
    if @get('controllers.application.isPhone')
      @get('avatarSmall')
    else
      @get('avatarLarge')
  ).property('avatarSmall', 'avatarLarge', 'controllers.application.isPhone')
