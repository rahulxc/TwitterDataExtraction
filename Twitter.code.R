install.packages('streamR')
install.packages('ROAuth')
install.packages('RCurl')
install.packages("twitteR")

library(ROAuth)
library(streamR)
library(RCurl)
library(twitteR)

#create your OAuth credential
credential <- OAuthFactory$new(consumerKey='2eqBXiNahfEsBNK9Hgyppdy4O',
                               consumerSecret='XA3xnJUkg4gFQA6Uiq9iTJwRMFddrKCa3fxuqVF5ONJNCFWdqf',
                               requestURL='https://api.twitter.com/oauth/request_token',
                               accessURL='https://api.twitter.com/oauth/access_token',
                               authURL='https://api.twitter.com/oauth/authorize')

#authentication process
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
credential$handshake(cainfo="cacert.pem")






#function to actually scrape Twitter
filterStream( file.name="tweets_test.json",
              track="lol", tweets=1000, oauth=credential, timeout=10, lang='en' )

tweet_df <- parseTweets(tweets='tweets_test.json')

summary(tweet_df)

#using the Twitter dataframe
tweet_df$created_at
tweet_df$text


plot(tweet_df$friends_count, tweet_df$followers_count) #plots scatterplot
cor(tweet_df$friends_count, tweet_df$followers_count) #returns the correlation coefficient


api_key <- "2eqBXiNahfEsBNK9Hgyppdy4O" # From dev.twitter.com
api_secret <- "	XA3xnJUkg4gFQA6Uiq9iTJwRMFddrKCa3fxuqVF5ONJNCFWdqf" # From dev.twitter.com
token <- "	26043650-gKRGypzAJbx5mq4O5bxEzC9VDDxnBOzaAvqLF5FQJ" # From dev.twitter.com
token_secret <- "FoSGi6Ctf6TIIWfemRPIQpcMzGHxuJxL6BSNDBsuZuFFY" # From dev.twitter.com

# Create Twitter Connection
setup_twitter_oauth(api_key, api_secret, token, token_secret)

install.packages("base64enc")

check_twitter_oauth()





# Run Twitter Search. Format is searchTwitter("Search Terms", n=100, lang="en", geocode="lat,lng", also accepts since and until).

tweets <- searchTwitter("Obamacare OR ACA OR 'Affordable Care Act' OR #ACA", n=100, lang="en", since="2014-08-20")

