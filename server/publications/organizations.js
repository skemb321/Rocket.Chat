Meteor.publish('organizations', function() {
  return Organization.find({});
});
