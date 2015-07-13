# Description:
#  marvin drops a dope beat
#
# Dependencies:
#
# Commands:
#   dj hubot drop the beat
#
# Author:
#   domingusj

module.exports = (robot) ->
  dope_beats = [
                  "http://youtu.be/mP4CM3B5t3g",
                  "http://youtu.be/UiLkTabdOBo",
                  "http://youtu.be/6g4dkBF5anU"
                  ]

  robot.respond /drop the beat/i, (msg) ->
    msg.send "Dance time: " +  msg.random  dope_beats
