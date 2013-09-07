LMS.ApplicationView = Ember.View.extend
  classNames: ['application']

  heightStyle: (->
    if @get('controller.isTabletResolution') || @get('controller.isDesktopResolution')
      "height: #{@get('controller.windowHeight')}px;"
  ).property('controller.windowHeight')
