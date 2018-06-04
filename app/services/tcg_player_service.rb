class TCGPlayerService < MasterService
  
  def initialize
    @url  = "info"
  end

  def get_info(name)
    JSON.parse(get(@url, { name: name }), symbolize_names: true)
  end
end
