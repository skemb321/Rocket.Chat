Meteor.publish 'organizations', (rid) ->
	unless this.userId
		return this.ready()

	userId = this.userId

	Organization.find()
