
# Teaspoon includes some support files, but you can use anything from your own support path too.
# = require support/pavlov
# = require support/sinon
# = require support/view_helpers
# = require support/ember_helpers
#
# Deferring execution
# If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call Teaspoon.execute()
# after everything has been loaded. Simple example of a timeout:
#
# Teaspoon.defer = true
# setTimeout(Teaspoon.execute, 1000)
#
# Matching files
# By default Teaspoon will look for files that match _test.{js,js.coffee,.coffee}. Add a filename_test.js file in your
# test path and it'll be included in the default suite automatically. If you want to customize suites, check out the
# configuration in config/initializers/teaspoon.rb
#
# Manifest
# If you'd rather require your test files manually (to control order for instance) you can disable the suite matcher in
# the configuration and use this file as a manifest.
#
# For more information: http://github.com/modeset/teaspoon
#
# You can require javascript files here. A good place to start is by requiring your application.js.
# = require vendor
# = require lastmanstanding
# = require spec_lifecycle

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>');
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>');

LMS.rootElement = '#ember-testing'
LMS.setupForTesting()

LMS.injectTestHelpers()

window.currentUserId = 1
LMS.Store = DS.Store.extend
  revision: 12
  adapter: DS.FixtureAdapter.create
    simulateRemoteResponse: true

