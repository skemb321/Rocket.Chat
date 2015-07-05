@ChatMessage = new Meteor.Collection 'data.ChatMessage'
Partitioner.partitionCollection ChatMessage, {index: {ts: 1}}
@ChatRoom = new Meteor.Collection 'data.ChatRoom'
Partitioner.partitionCollection ChatRoom, {index: {ts: 1}}
@ChatSubscription = new Meteor.Collection 'data.ChatSubscription'
Partitioner.partitionCollection ChatSubscription, {index: {ts: 1}}
@Organization = new Meteor.Collection 'data.organization'
