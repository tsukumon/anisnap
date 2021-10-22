class Rack::Attack
  # 同一IPアドレスからのリクエストを20回/秒に制限
  throttle('req/ip', limit: 20, period: 1.second) do |req|
    req.ip
  end
end
