Meteor.methods({
  createOrganization: function(name) {
    if(/^[0-9a-z-_]+$/i.test(name)){
      org = Organization.insert({
        name: name,
        ts: new Date()
      });
      return org;
    } else {
      throw new Meteor.Error('name-invalid');
    }
  },
});
