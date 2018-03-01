class StocksController < ApplicationController

  def index
    if params[:id] == ""
      @notice = "Hey, you forgot to enter a symbol"
    elsif

      if params[:id]
        begin
          @stock = StockQuote::Stock.quote(params[:id])
        rescue StandardError
          @errors = "That Stock Symbol Does't Exist... please try again."
        end
        
      end
    end
  end

end
