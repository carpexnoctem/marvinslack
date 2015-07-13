# Description:
#   Gives a random Office quote from @officequotesnet
#
# Dependencies:
#   'twit': '1.1.6'
#   'underscore': '1.4.4'
#
# Commands:
#   hubot office quote me - Show random tweet from @officequotesnet
#   hubot office bomb <n> - Show <n> random tweets from @officequotesnet
#
# Author:
#   domingusj

_ = require 'underscore'
Twit = require 'twit'
config =
  consumer_key: 'gZGCwAlPwrdbSjVrwl5FSq3HT'
  consumer_secret: 'xOpS4zbinVVSCR6Gs6gtPT7JPit0tujYRPSheMlpDld8Dqv9VD'
  access_token: '3275213096-ryNgNrtehRy2ZyCGPuVkvkW9rhmGIzZOc48ISaj'
  access_token_secret: '1xx78ADWZgf6WxzadtNphsmyhyQUhWr34oFXArL04S8kf'

module.exports = (robot) ->
  twit = new Twit config

  officequote_says = (msg, count = 1) ->
    twit.get 'statuses/user_timeline',
      screen_name: escape('officequotesnet')
      count: 10000
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.send "Error #{err}" if err
      messages = _.sample(reply, count)
      messages.map (message) ->
        msg.send _.unescape(message['text'])

  robot.respond /office quote me/i, (msg) -> officequote_says msg

  robot.respond /office bomb( (\d+))?/i, (msg) -> officequote_says msg, msg.match[2] || 5
