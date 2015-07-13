# Description:
#   Reminds Vince to head out for lunch

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'America/Denver'
  room = '6ab3aa14-50cb-416e-9b59-085f94508866'
  lunchTime = ->
    robot.messageRoom room, 'Time for lunch Vince! See ya soon!'
  new cronJob('0 56 10 * * 1-5', lunchTime, null, true, tz)
