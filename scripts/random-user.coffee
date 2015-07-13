# Description:
#  Returns a random user from the list
#
# Dependencies:
#
# Commands:
#   hubot random user
#
# Author:
#   jds

module.exports = (robot) ->
  userList = [
                  "Tyler!",
                  "Natalie!",
                  "Eli!",
                  "Vince!",
                  "Jordan!",
                  "Justin!",
                  "JD!"
                  ]

  robot.respond /random user/i, (msg) ->
    msg.send "The lucky winner is: " +  msg.random userList