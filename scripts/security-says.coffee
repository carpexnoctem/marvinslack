# Description:
#   Security chimes in with their 2 cents
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   security jargon - summons security team - ripped off of business cat
#
# Notes
#   See jargon array for list of trigger phrases
#
# Author:
#   domingusj

security_response = require './security_says_data/security_response.json'
jargon = require './security_says_data/triggers.json'
regex = new RegExp jargon.join('|'), 'gi'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    msg.send "Security says: " + msg.random security_response
