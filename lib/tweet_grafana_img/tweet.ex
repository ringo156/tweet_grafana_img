defmodule TweetGrafanaImg.Tweet do

  use Application

  def tweet(text) do
    ExTwitter.configure(
      consumer_key: Application.get_env(:extwitter, :oauth)[:consumer_key],
      consumer_secret: Application.get_env(:extwitter, :oauth)[:consumer_secret],
      access_token: Application.get_env(:extwitter, :oauth)[:access_token],
      access_token_secret: Application.get_env(:extwitter, :oauth)[:access_token_secret],
    )
    resp = ExTwitter.update(text)
  end

  def tweet(text, media) do
    ExTwitter.configure(
      consumer_key: Application.get_env(:extwitter, :oauth)[:consumer_key],
      consumer_secret: Application.get_env(:extwitter, :oauth)[:consumer_secret],
      access_token: Application.get_env(:extwitter, :oauth)[:access_token],
      access_token_secret: Application.get_env(:extwitter, :oauth)[:access_token_secret],
    )
    resp = ExTwitter.update_with_media(text, media)
  end

  # ToDo: 画像複数枚tweetするときどうするか確認とテストする

end
