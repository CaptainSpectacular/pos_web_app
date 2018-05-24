class MasterService
  protected

  def conn
    Faraday.new('http://api.tcgplayer.com')
  end

  def get(url, &block)
    conn.get do |req|
      req.headers['Authorization'] = 'bearer ' + ENV['BEARER_TOKEN'] 
      req.url url
      req.params = yield if block_given? 
    end.body
  end
end
