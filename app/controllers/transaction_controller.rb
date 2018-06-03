class TransactionController < ApplicationController

  def update
    session[:current_transaction].merge!({params[:card] => 1}) do |k, old, new| 
      new + old
    end
  end

end
