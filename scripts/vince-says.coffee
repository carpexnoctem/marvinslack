# Description:
#  vince quotes
#
# Dependencies:
#
# Commands:
#   hubot vince quote me
#
# Author:
#   domingusj

module.exports = (robot) ->
  vince_quotes = [
                  "What's on tap? Is it Coors Lite yet?",
                  "(on phone) Yea for sure we can totally do that. (off phone) JD can we actually do that?",
                  "I'm from Florida man.",
                  "Oh man!",
                  "I delegate all my tickets to Justin",
                  "Is it Friday yet?",
                  "Let me check Twitter.",
                  ]

  robot.respond /vince quote me/i, (msg) ->
    msg.send "Vince says: " +  msg.random vince_quotes
