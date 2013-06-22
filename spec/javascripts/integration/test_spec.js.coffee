#=require spec_helper

describe "stuff", ->
  beforeEach ->
    LMS.League.FIXTURES = [
      {id: 1, name: "AFL"}
    ]

    LMS.Profile.FIXTURES = [
      {id: 1, name: "Rob"}
    ]

    Ember.run -> LMS.advanceReadiness()


  it "navigates to dashboard", ->
    visit("/dashboard").then ->
      expect(true)

  it "navigates to new game", ->
    visit("/games/new").then ->
      fill('League', 'aa')
      expect(true)

