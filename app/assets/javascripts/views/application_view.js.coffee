LMS.ApplicationView = Ember.View.extend
  classNames: ['application']

  heightStyle: (->
    "height: #{@get('controller.windowHeight')}px;"
  ).property('controller.windowHeight')
