Meteor.methods
	switchOrganization: (orgId) ->
		Partitioner.clearUserGroup(Meteor.userId())
		Partitioner.setUserGroup(Meteor.userId(), orgId)
