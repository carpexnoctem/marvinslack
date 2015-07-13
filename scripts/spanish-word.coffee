# Description:
#  learn español
#
# Dependencies:
#
# Help:
# 
# Commands:
#   hubot spanish word of the day
#
# Author:
#   domingusj, ediaz

module.exports = (robot) ->
  spanish_words = [
                  "el gato is the cat",
                  "el perro is the dog"
                  ]

  robot.respond /spanish word of the day/i, (msg) ->
    msg.send "Eli's word of the day is: " +  msg.random  spanish_words
