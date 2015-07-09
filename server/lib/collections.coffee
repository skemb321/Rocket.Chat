@Organization = new Meteor.Collection 'data.organization'
@ChatMessage = new Meteor.Collection 'data.ChatMessage'
Partitioner.partitionCollection ChatMessage, {index: {ts: 1}}
@ChatRoom = new Meteor.Collection 'data.ChatRoom'

if not Organization.findOne('name': 'Cavaliers')?
  # Create Groups
  #########################################
  group2 = Organization.insert
    name: 'Cavaliers'
    ts: new Date

  group1 = Organization.insert
    name: 'Warriors'
    ts: new Date

  # Users group 1
  ##########################################
  group1user1 = Meteor.users.insert
    createdAt: new Date
    emails: [
      address: 'stephencurry@somewhere.com'
      verified: true
    ]
    name: 'Stephen'
    avatarOrigin: 'none'
    _groupId: group1

  Accounts.setPassword group1user1, '123456'

  group1user2 = Meteor.users.insert
    createdAt: new Date
    emails: [
      address: 'klaythompson@somewhere.com'
      verified: true
    ]
    name: 'Klay'
    avatarOrigin: 'none'
    _groupId: group1

  Accounts.setPassword group1user2, '123456'


  # Users group 2
  ###########################################
  group2user1 = Meteor.users.insert
    createdAt: new Date
    emails: [
      address: 'kyrieirving@somewhere.com'
      verified: true
    ]
    name: 'Kyrie'
    avatarOrigin: 'none'
    _groupId: group2

  Accounts.setPassword group2user1, '123456'

  group2user2 = Meteor.users.insert
    createdAt: new Date
    emails: [
      address: 'lebronjames@somewhere.com'
      verified: true
    ]
    name: 'Lebron'
    avatarOrigin: 'none'
    _groupId: group2

  Accounts.setPassword group2user2, '123456'

  # Chat Rooms Group 1
  ###########################################
  ChatRoom.insert
    usernames: ['Klay', 'Kyrie']
    ts: new Date()
    t: 'c'
    name: 'athletes'
    msgs: 0
    _groupId: group1

  ChatRoom.insert
    usernames: ['Klay', 'Stephen']
    ts: new Date()
    t: 'c'
    name: 'gameplan'
    msgs: 0
    _groupId: group1


  # Chat Rooms Group 2
  ###########################################
  ChatRoom.insert
    usernames: ['Lebron', 'Kyrie']
    ts: new Date()
    t: 'c'
    name: 'stars'
    msgs: 0
    _groupId: group2

  ChatRoom.insert
    usernames: ['Lebron', 'Kyrie']
    ts: new Date()
    t: 'c'
    name: 'coaches'
    msgs: 0
    _groupId: group2

Partitioner.partitionCollection ChatRoom, {index: {ts: 1}}

@ChatSubscription = new Meteor.Collection 'data.ChatSubscription'
Partitioner.partitionCollection ChatSubscription, {index: {ts: 1}}
@ChatTyping = new Meteor.Collection 'data.ChatTyping'
Partitioner.partitionCollection ChatTyping, {index: {ts: 1}}
