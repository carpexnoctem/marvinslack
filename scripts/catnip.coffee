# Description:
#   Random image from /r/awwducational
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot inspire me - Pull a random cat from /r/awwducational
#
# Author:
#   domingusj

module.exports = (robot) ->
  robot.respond /drop some knowledge( .+)*/i, (msg) ->
    reddit msg, msg.match[1]?.trim()

reddit = (msg) ->
  url = "http://www.reddit.com/r/awwducational.json"
  msg
    .http(url)      
      .get() (err, res, body) ->
        
        # Sometimes when a subreddit doesn't exist, it wants to redirect you to the search page.
        # Oh, and it doesn't send back 302s as JSON
        if body?.match(/^302/)?[0] == '302'
          msg.send "That subreddit does not seem to exist."
          return

        posts = JSON.parse(body)

        # If the response has an error attribute, let's get out of here.
        if posts.error?
          msg.send "That doesn't seem to be a valid subreddit. [http response #{posts.error}]"
          return

        unless posts.data?.children? && posts.data.children.length > 0
          msg.send "While that subreddit exists, there does not seem to be anything there."
          return

        post = getPost(posts)

        tries_to_find_picture = 0

        while post?.domain != "i.imgur.com" && tries_to_find_picture < 30
          post = getPost(posts)
          tries_to_find_picture++
        
        # Send pictures with the url on one line so Campfire displays it as an image
        if post.domain == 'i.imgur.com'
          msg.send "#{post.title} - http://www.reddit.com#{post.permalink}"
          msg.send post.url
        else
          msg.send "#{post.title} - #{post.url} - http://www.reddit.com#{post.permalink}"

getPost = (posts) ->
  random = Math.round(Math.random() * posts.data.children.length)
  posts.data.children[random]?.data
