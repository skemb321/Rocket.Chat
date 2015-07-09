# Partitioned Rocket Chat (with adminitration)
RocketChat in groups!

# Initial Data
#### Groups
Group 1: Warriors
Group 2: Cavaliers

#### Group 1 Users (username/password)
* stephencurry@somewhere.com/123456
* klaythomspons@somewhere.com/123456

#### Group 2 Users (username/password)
* lebronjames@somewhere.com/123456
* kyrieirving@somewhere.com/123456

#### Group 1 Channels
* #athletes
* #gameplan

#### Group 2 Channels
* #stars
* #coaches

# Documentation/FAQ/HOWTO:

This version of RocketChat uses mizzao:meteor-partitioner package that will enable you to partiotioned your chat to groups.

### How to add a group:
Apart from the initial data above, admin can add new groups to the app by going to /admin (i.e. localhost:3000/admin). From there, you can also view the existing groups.
   
### I didn't see meteor-partitioner installed, why?:
  This app uses another version of meteor-partioner available @ atmospherejs.com with name `skemb321:partitioner-fork`. Basically, `skemb321:partitioner-fork`, is just a fork of `mizzao:meteor-partitioner` package but with some changes in it's `Helpers` global namespace. To see the changes https://github.com/skemb321/meteor-partitioner
  

### What are the changes made to basecode of Rocket.Chat?
   1. Add meteor package: `skemb321:partitioner-fork`
   2. Use Partitioner.partitionCollection(meteor.collection, option) to partion our collections.
   3. Added new route for admin to create groups (/admin)
   4. Some scripts for initial data upon startup.
   5. JS for creation of groups
   To view the changes click [here](https://github.com/skemb321/Rocket.Chat/pull/3/files)
  
### Running the app locally:
   1. Clone this repo
   2. cd Rocket.Chat
   3. meteor

### How do I update my version of Rocket.Chat?
   1. When developing, always checkout a new branch
   2. When official Rocket.Chat repo has some updates, fetch it using `git fetch official` then ALWAYS use `git rebase official/master`. This will make it easier to merge updates from the official repo to yours. Check git rebase in git manual for more info.

### What's not supported in this version:
   1. Notifications - notifications dont appear
   2. Unread messages count - they don't appear anymore
   3. Private Messages Bug - Users can still PM users from other groups. :sad:

### Summary:
   * I hope Rocket.Chat code will be re-written in javascript not in coffeescript so more users can extend it.
   * Mizzao should really update his package re my change to it.
   * I hope Rocket.Chat will have more feature to come like sending a voice file would be very fun.


