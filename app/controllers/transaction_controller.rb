class TransactionController < ApplicationController

  def update
    session[:current_transaction].merge!({params[:card] => params[:quantity].to_i}) do |k, old, new| 
      new + old
    end
    session[:current_transaction].reject!{ |_, v| v <= 0 }

    redirect_back(fallback_location: pos_path)
  end

end
