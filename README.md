# Movie Night

Create a new movie night group with your friends. Set up an event for each movie night and where you and your friends can indicate whether you are attending.

Rate each movie and add your comments in the group page!

[Click here](https://movienight-irl.herokuapp.com/) to access the site.

## New User Process

* Visit the site and create a user account.
* From here you can create a new group or search for an existing group.
* When you find the group you want to join, request access.
* The group admin will see your request next time they log in and will approve or deny your request.
* When creating a new group, you become the group admin.
* Group names must not already exist.

## Website Admin
* Website admin has access to view all users, groups and events. Other users are denied access to this information.

## Groups
* If a user is a member of a group, they will see a link to this group in the second navigation bar.
* Any group member can create an event within the group page.
* Within the group page, a list of all events will be shown in descending order of event date.
* All group members can indicate their attendance. Once attending, you can remove your attendance if necessary.
* The choice of film can be rated by each user. Each user has only one rating but can change ratings by simply clicking on their new rating emoji.

## Group Admins
* Group admins may choose to make other users a group admin. This must happen before they are allowed to leave the group, as each group must have at least one admin.
* Group admins may remove any other user from the group.

### Gems and APIs
* Sweet Alert (gem did not work, included JS and CSS file)
* HTTParty to access OMDB API
* Disqus for comments
* Animate.css for CSS animation
* Hover.css for CSS animation
* Cloudinary for image upload
