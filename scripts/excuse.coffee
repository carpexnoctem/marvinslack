# Description:
#  Listens for someone needing an excuse or solution to a problem & provides it
#
# Dependencies:
#
# Commands:
#   excuse / problem - get a valid bofh excuse
#
# Author:
#   tknodell

excuse_response = require './excuses.json'

module.exports = (robot) ->
  robot.hear /excuse|problem/i, (msg) ->
    msg.send "The cause of the problem is: " +  msg.random excuse_response