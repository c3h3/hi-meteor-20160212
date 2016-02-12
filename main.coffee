@Earthquake = new Mongo.Collection "earthquake"

Router.configure
  layoutTemplate: 'layout'
    

Meteor.startup ->
  Router.map -> 
    @route "index",
      path: "/"
      template: "indexPage"

    @route "eq",
      path: "/eq/"
      template: "eqPage"
      data: ->
        resData = 
          earthquakeMsgs: ->
            Earthquake.find()


    @route "tws",
      path: "/tws/"
      template: "twsPage"

    @route "gp",
      path: "/gp/"
      template: "gpPage"

    @route "gpp",
      path: "/gpp/"
      template: "gppPage"


      
# if Meteor.isClient
#   Template.body.helpers
#     earthquakeMsgs: ->
#       Earthquake.find()

if Meteor.isServer
  Meteor.publish null, ->
    Earthquake.find()