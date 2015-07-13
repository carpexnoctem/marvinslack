# Description:
#  Justin quotes
#
# Dependencies:
#
# Commands:
#   hubot justin quote me
#
# Author:
#   domingusj

module.exports = (robot) ->
  justin_quotes = [
                  "I delegate my tickets to Eli",
                  "Two words...Jerry...Allen"
                  "Hang on, this is gonna be cool"
                  ]

  robot.respond /justin quote me/i, (msg) ->
    msg.send "Justin says: " +  msg.random justin_quotes
