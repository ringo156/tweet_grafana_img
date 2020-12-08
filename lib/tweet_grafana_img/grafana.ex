defmodule TweetGrafanaImg.Grafana do

  use Application

  @url ""
  @token ""

  def get_graph() do
    headers = make_headers(@token)
    params = make_params(System.os_time - 86400 * 1000000000, System.os_time)
    options = make_options(5000)
    request = make_request(:get, headers, options, params, @url)
    HTTPoison.request(request)
  end

  def make_request(method, headers, options, params, url) do
    %HTTPoison.Request{
      method: method,
      headers: headers,
      options: options,
      params: params,
      url: url
    }
  end

  def make_headers(token) do
    ["Authorization": "Bearer #{token}"]
  end
  # 86400 = 24 * 60 * 60
  # params = make_params(System.os_time - 86400 * 1000000000, System.os_time)

  def make_params(from, to) do
    [
      {~s|orgId|, ~s|1|},
      {~s|from|, ~s|#{from}|},
      {~s|to|, ~s|#{to}|},
      {~s|panelId|, ~s|2|},
      {~s|width|, ~s|1000|},
      {~s|height|, ~s|500|},
      {~s|tz|, ~s|Asia/Tokyo|},
    ]
  end

  def make_options(timeout) do
    [hackney: [:insecure], recv_timeout: timeout]
  end

end


# 処理の流れ（イメージ）
# url
# headers
# params
# options: [hackney: [:insecure], recv_timeout: 8000]
# request = %HTTPoison.Request{method: :get, headers: headers, options: options, params: params, url: url}
# {:ok, resp} = HTTPoison.request(request)
