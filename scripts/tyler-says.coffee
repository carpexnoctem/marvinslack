# Description:
#  tyler quotes
#
# Dependencies:
#
# Commands:
#   hubot tyler quote me
#
# Author:
#   domingusj

module.exports = (robot) ->
  tyler_quotes = [
                  "Well that's fair.",
                  "Whatever, fair enough.",
                  "Oh, your code is broken? Guess you need to email helpdesk.",
		  "I don't know, just email helpdesk.",
		  "At the end of the day, it's whatever.",                  
		  "I don't know, just do whatever you want.",
		  "We had to get to the club.",
		  "There's about a million ways to skin a cat, but you probably shouldn't try to do them all at once.",
		  ]		

  robot.respond /tyler quote me/i, (msg) ->
    msg.send "Tyler says: " +  msg.random tyler_quotes
