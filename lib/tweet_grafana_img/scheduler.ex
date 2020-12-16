defmodule TweetGrafanaImg.Scheduler do
  use Quantum, otp_app: :tweet_grafana_img

  def daily_tweet do
    {:ok, resp} = TweetGrafana.Grafana.get_panel()

    date =  Timex.now("Asia/Tokyo") |> Timex.to_date() |> Timex.shift(days: -1)
    text = "#{date.year}/#{date.month}/#{date.day}"
    TweetGrafanaImg.Tweet.tweet(text, resp.body)

  end

  def testfunc do
    IO.puts("test scheduler!")
  end
end
