Meteor.subscribe('organizations')

Template.organizations.helpers
	tRoomMembers: ->
		return t('Members_placeholder')

	organizations: ->
		return Organization.find {owner: Meteor.userId()}

	isDefaultGroup: ->
		return Partitioner.group() == 'DEFAULT'

Template.organizations.events
	'click .add-room': (e, instance) ->
		SideNav.setFlex "createOrganizationFlex"
		SideNav.openFlex()

	'click .more-channels': ->
		SideNav.setFlex "listChannelsFlex"
		SideNav.openFlex()

	'click .switchToDefault': (e, instance) ->
		Meteor.call 'switchOrganization', e.target.id, (error, result) ->
			if result
				location.reload()
