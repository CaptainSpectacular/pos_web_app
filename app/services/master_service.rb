class MasterService
  protected

  def conn
    Faraday.new('http://api.tcgplayer.com')
  end

  def get(url, params = {})
    conn.get do |req|
      req.headers['Authorization'] = 'bearer ' + ENV['BEARER_TOKEN'] 
      req.url url
      req.params = params
    end.body
  end
end
