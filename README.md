# Open-Ears-Pairing-Dashboard Web Application
## The Info
The nature of this project is to take information from Friends and Warriors alike and to put them all into one database that may easily be accessed by the Pairing Dashboard to allow an ease of pairing for the UIUC Open Ears Pairing Staff. This project will consist of the following:

##### The Big TODO
- [x] A fully structured database in MySQL
- [ ] A Fully fleshed out user interface for the dashboard
- [ ] A form to fill for Warriors and Friends
- [ ] Customizable dash and form -- _This is a stretch goal_

## The Database
The specifics of the database get a little harder as a few things need to be ironed out, nameably how it is that we plan to gather data from the warriors and friends, and what it is that we wish to gather. In order to create a fully modular and flexible data store of warrior and friend information I have utilized key value pairs, with a reference table in order to retrieve the meaning of each value that a user may answer, which provides the flexibility of a custom form for the Pairing Staff, while also allowing ease of use from our queries in the future from the reference table to generate the display of each user on the dashboard.

This comes to the database itself, in that in it's present state I would call it almost entirely fleshed out, save for a few changes which may be done in the future to increase the flexible nature of the web application

##### The Database TODO
- [x] Establish the main tables
- [x] Create indexes to improve searching speed
- [x] Test with false data

## The Dashboard (Web Application)
So far the overall thought of the desire has been to keep it minimal and to imitate other well know interfaces to administrate users and information. Specifically, I'm taking inspiration from places such as CPanel and the things that pop up from a google search of admin panel

##### Dashboard TODO
- [ ] Create flow of pages (How many, which ones, where do they go)
- [ ] Create general look and feel of the web application as a whole
- [ ] Integrate database to web application
- [ ] Manage permissions admins to access the page, perhaps a sign in
- [ ] Search for some kind of hosting

##### Pages TODO
- [ ] Home Page
- [ ] Users Page
- [ ] Pairing Page
- [ ] Pairing History Page
- [ ] Settings Page

#### Users Page DEMO
![Users Page Screenshot](https://github.com/Smidds/Open-Ears-Pairing-Dashboard/assets/usersPage.gif)

## The Form
This one is pretty simple, I'm just thinking that the creation of a form for applying as a Friend or Warrior will be necessary in order to send information to the database.

##### Form TODO
- [ ] Create form for Warriors
- [ ] Create form for Friends


## Wrapping it up
As you can see, that's about all that's set for right now, and I'm just going down the line, top to bottom (although the nature of the dashboard and form might necessitate that I shake up the order at some point, we'll see). If you have any questions are would like to contribute, feel free to do so!
