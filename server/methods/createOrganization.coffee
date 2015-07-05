Meteor.methods
	createOrganization: (name) ->
		if not Meteor.userId()
			throw new Meteor.Error 'invalid-user', "[methods] createChannel -> Invalid user"

		if /^[0-9a-z-_]+$/i.test name
      org = Organization.insert
        owner: Meteor.userId()
        name: name
        ts: new Date()

      return org

    else
      throw new Meteor.Error 'name-invalid'
