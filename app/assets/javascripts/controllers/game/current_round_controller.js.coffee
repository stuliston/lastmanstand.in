#=require ./round_controller
LMS.GameCurrentRoundController = LMS.GameRoundController.extend

  needs: ['game']
  modelBinding: 'controllers.game.season.rounds.firstObject' #for now