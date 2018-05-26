class TCGPlayerService < MasterService
  
  def initialize
    @card_url  = "/v1.9.1/catalog/products"
    @price_url = "/pricing/marketprices"
  end

  def card_info(name)
    JSON.parse(get(@card_url, { productName: name }), symbolize_names: true)
  end

  def get_price(con_id)
    JSON.parse(get(@price_url + "/#{con_id}"), symbolize_names: true)
  end
end
