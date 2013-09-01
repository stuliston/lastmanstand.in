LMS.Router.map ->

  @route('sign_in')

  @resource('users', ->
    @route('new')
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
