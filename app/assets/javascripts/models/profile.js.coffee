LMS.Profile = DS.Model.extend
  name: DS.attr 'string'
  games: DS.hasMany('LMS.Game')


#These will go very soon
LMS.Profile.FIXTURES = [

  {id: 1, name: "Rob Monie", games: [1, 2] }
  {id: 2, name: "Stu Liston", games: [1, 2] }

]

