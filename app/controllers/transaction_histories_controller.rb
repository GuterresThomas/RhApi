class TransactionHistoriesController < ApplicationController
    before_action :set_transaction_history, only: [:show, :update, :destroy]

    def index
      @transaction_histories = TransactionHistory.all
      render json: @transaction_histories
    end
  
    def show
      render json: @transaction_history
    end
  
    def create
      @transaction_history = TransactionHistory.new(transaction_history_params)
  
      if @transaction_history.save
        render json: @transaction_history, status: :created
      else
        render json: @transaction_history.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @transaction_history.update(transaction_history_params)
        render json: @transaction_history
      else
        render json: @transaction_history.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @transaction_history.destroy
      head :no_content
    end
  
    private
  
    def set_transaction_history
      @transaction_history = TransactionHistory.find(params[:id])
    end
  
    def transaction_history_params
      params.require(:transaction_history).permit(:event_type, :description, :timestamp, :cash_register_id)
    end
end
