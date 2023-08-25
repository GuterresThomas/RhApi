class SalesController < ApplicationController
    before_action :set_sale, only: [:show, :update, :destroy]

    def index
      @sales = Sale.all
      render json: @sales
    end
  
    def show
      render json: @sale
    end
  
    def create
      @sale = Sale.new(sale_params)
  
      if @sale.save
        render json: @sale, status: :created
      else
        render json: @sale.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @sale.update(sale_params)
        render json: @sale
      else
        render json: @sale.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @sale.destroy
      head :no_content
    end
  
    private
  
    def set_sale
      @sale = Sale.find(params[:id])
    end
  
    def sale_params
      params.require(:sale).permit(:date, :total, :customer_id)
    end
end
