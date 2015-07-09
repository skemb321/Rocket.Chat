Meteor.subscribe('organizations')

Template.adminForm.events({
  'submit #create-group-form': function(event, instance) {
    event.preventDefault()
    Meteor.call(
      'createOrganization',
      instance.find('#org-name').value,
      function (error, result){
        if(error){
          alert('Invalid Name. Try another one.')
        } else {
          instance.find('#org-name').value = "";
        }
      }
    )
  },
});

Template.adminForm.helpers({
  'organizations': function() {
    return Organization.find()
  },
});
