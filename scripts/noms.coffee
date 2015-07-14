# Description:
#  Returns a random restaurant from the list
#
# Dependencies:
#
# Commands:
#   hubot feed me
#
# Author:
#   jds

module.exports = (robot) ->
  restaurants = [
                  "McDonalds!",
                  "Chipotle!",
                  "Food Truck!",
                  "Verde!",
                  "Firehouse!",
                  "Qdoba!",
                  "Jimmy Johns!",
                  "Burger King",
                  "Wendys",
                  "BC Burrito",
                  "Five Guys"
                  ]

  robot.respond /feed me/i, (msg) ->
    msg.send "Winner: " +  msg.random restaurants
