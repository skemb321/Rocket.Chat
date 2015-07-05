Template.createOrganizationFlex.helpers
	name: ->
		return Template.instance().selectedUserNames[this.valueOf()]

	error: ->
		return Template.instance().error.get()

	roomName: ->
		return Template.instance().roomName.get()

Template.createOrganizationFlex.events
	'click header': (e, instance) ->
		SideNav.closeFlex()

	'click .cancel-channel': (e, instance) ->
		SideNav.closeFlex()

	'mouseenter header': ->
		SideNav.overArrow()

	'mouseleave header': ->
		SideNav.leaveArrow()

	'keydown input[type="text"]': (e, instance) ->
		Template.instance().error.set([])

	'click .save-org': (e, instance) ->
		err = SideNav.validate()
		instance.roomName.set instance.find('#org-name').value
		console.log err
		if not err
			Meteor.call 'createOrganization', instance.find('#org-name').value, (err, result) ->
				if err
					console.log err
					if err.error is 'name-invalid'
						instance.error.set({ invalid: true })
						return
					else
						return toastr.error err.reason

				SideNav.closeFlex()

				instance.clearForm()

				# Router.go 'room', { _id: result.rid }
		else
			instance.error.set({ fields: err })

Template.createOrganizationFlex.onCreated ->
	instance = this
	instance.selectedUsers = new ReactiveVar []
	instance.selectedUserNames = {}
	instance.error = new ReactiveVar []
	instance.roomName = new ReactiveVar ''

	instance.clearForm = ->
		instance.error.set([])
		instance.roomName.set('')
		instance.selectedUsers.set([])
		instance.find('#org-name').value = ''
