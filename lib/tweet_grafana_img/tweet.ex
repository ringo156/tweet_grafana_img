defmodule TweetGrafanaImg.Tweet do

  use Application

  def tweet(text) do
    ExTwitter.configure(
      consumer_key: Application.get_env(:extwitter, :oauth)[:consumer_key],
      consumer_secret: Application.get_env(:extwitter, :oauth)[:consumer_secret],
      access_token: Application.get_env(:extwitter, :oauth)[:access_token],
      access_token_secret: Application.get_env(:extwitter, :oauth)[:access_token_secret],
    )
    ExTwitter.update(text)
  end

end
