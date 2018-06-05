class MasterService
  protected

  def conn
    Faraday.new('https://mtginventory-api.herokuapp.com/api/v1')
  end

  def get(url, params = {})
    conn.get do |req|
      req.headers['api-id'] = ENV['API_ID'] 
      req.headers['api-key'] = ENV['API_KEY'] 
      req.url url
      req.params = params
    end.body
  end
end
