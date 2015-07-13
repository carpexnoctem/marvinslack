# Description:
#  eli quotes
#
# Dependencies:
#
# Commands:
#   hubot eli quote me
#
# Author:
#   domingusj

module.exports = (robot) ->
  eli_quotes = [
                  "I'm going to Your-ass-ic park.",
                   "I put a lot of sugar in my coffee...cause you know mexicans are sweet!",
                   "He's my brother. I'll have a brat. He's a fruit.",
                   "Tomorrow's a new day. Thanks for the cheese.",
                   "Let's everybody squeeze our heads..",
                   "Everyone in Engineering is watching it on JewTube (YouTube).",
                   "Ben like Big Rich?.",
                   "I think I'm Asian or something.",
                   "I'm gonna go throw myself in the lake this weekend.",
                   "I don't cry, but when I cry, I use facial tissue.",
                   "A baby is like a million dollars.",
                   "I was made in Mexico, but born in America.",
                   "The pole is up, now dance.",
                   "I'm a picky girl.",
                   "2 for a nickel. I woke up kinda funny today.",
                   "Is that the Titanic?.",
                   "I would just power it off.",
                   "I see...said the blind man",
                   "(If the cream goes bad)...want some quessoooooo?",
                   "Keep'n it local, not loco",
                   "Andrea is in Canada, say hi to Drake for me!",
                   "They got that kick",
                   "You know what they say if you sneeze more than once...your girl is with someone else!",
                   "You want a raise? What size shoe do you wear, I'll buy you some heels."
                  ]

  robot.respond /eli quote me/i, (msg) ->
    msg.send "Eli says: " +  msg.random  eli_quotes
