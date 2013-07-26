
//From - https://github.com/emberjs/group-helper

Ember.Handlebars.registerHelper('group', function(options) {
  var data = options.data,
      fn   = options.fn,
      view = data.view,
      childView;

  childView = view.createChildView(Ember._MetamorphView, {
    context: Ember.get(view, 'context'),

    template: function(context, options) {
      options.data.insideGroup = true;
      return fn(context, options);
    }
  });

  view.appendChild(childView);
});