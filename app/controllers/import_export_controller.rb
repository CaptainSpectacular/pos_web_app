class ImportExportController < ApplicationController
  before_action :set_importer, only: [:create]

  def create
    @importer.load 
    flash[:success] = "CSV successfully imported. #{@importer.unique} unique items were added and #{@importer.total} total items were added with #{@importer.failed} failures."
    redirect_to inventory_path(current_inventory)
  end

  private

  def set_importer
    @importer = Importer.new(params[:file][:csv], current_inventory)
  end
end
