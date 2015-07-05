Template.orgItem.events
	'click .switchOrg': (e, instance) ->
		Meteor.call 'switchOrganization', e.target.id, (error, result) ->
			if result
				# Router.go 'index'
				location.reload()

	'click .more-channels': ->
		SideNav.setFlex "listChannelsFlex"
		SideNav.openFlex()

Template.orgItem.helpers
	currentOrg: ->
		return Partitioner.group() == this._id
