Meteor.subscribe('organizations')

Template.organizations.helpers
	tRoomMembers: ->
		return t('Members_placeholder')

	organizations: ->
		return Organization.find()

	isDefaultGroup: ->
		return Partitioner.group() == 'DEFAULT'

Template.organizations.events
	'click .add-room': (e, instance) ->
		if not Meteor.user.username == 'admin'
			return false
		SideNav.setFlex "createOrganizationFlex"
		SideNav.openFlex()

	'click .more-channels': ->
		SideNav.setFlex "listChannelsFlex"
		SideNav.openFlex()

	'click .switchToDefault': (e, instance) ->
		Meteor.call 'switchOrganization', e.target.id, (error, result) ->
			if result
				location.reload()
