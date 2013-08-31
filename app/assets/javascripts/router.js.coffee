LMS.Router.map ->

  this.resource('users', ->
    this.route('new')
  )

  this.resource('sessions', ->
    this.route('new')
    this.route('destroy')
  )

  @resource('games', {path: '/games'}, ->
    @route('new')
    @resource('game', {path: ':game_id'}, ->
      @route('members')
      @route('rounds')
      @route('edit')
      @route('round', {path: '/rounds/:round_number'}) #weird !
    )
  )
  @resource('game_invitations')

LMS.Router.reopen
  location: 'history'
