# Description:
#   Morning Marvin Message - every morning at 8am

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'America/Denver'
  room = '6ab3aa14-50cb-416e-9b59-085f94508866'
  everyMonday = ->
    robot.messageRoom room, "It is Monday again: https://youtu.be/2AB9zPfXqQQ"
  new cronJob('0 0 8 * * 1', everyMonday, null, true, tz)
  everyTuesday = ->
    robot.messageRoom room, "Tuesday. Now post your standup and get on with it."
  new cronJob('0 0 8 * * 2', everyTuesday, null, true, tz)
  everyWednesday = ->
    robot.messageRoom room, "Hump Day!"
  new cronJob('0 0 8 * * 3', everyWednesday, null, true, tz)
  everyThursday = ->
    robot.messageRoom room, "Morning everybody - it is Thursday! Now get to work!"
  new cronJob('0 0 8 * * 4', everyThursday, null, true, tz)
  everyFriday = ->
    robot.messageRoom room, "Friday! Time to post the jukebox!"
  new cronJob('0 0 8 * * 5', everyFriday, null, true, tz)
  everySaturday = ->
    robot.messageRoom room, "Hey, where is everyone? You all are lazy!"
  new cronJob('0 0 8 * * 6', everySaturday, null, true, tz)