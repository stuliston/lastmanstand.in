LMS.ApplicationView = Ember.View.extend
  classNames: ['application']
  topBottomMargin: 20

  heightStyle: (->
    if @get('controller.isTabletResolution')
      height = @get('controller.windowHeight')
    else if @get('controller.isDesktopResolution')
      height = @get('controller.windowHeight') - (@get('topBottomMargin') * 3)

    if height
      "height: #{height}px;"
    else
      ""
  ).property('controller.windowHeight')
