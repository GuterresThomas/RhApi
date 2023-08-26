class SalesController < ApplicationController
    before_action :set_sale, only: [:show, :update, :destroy]

    def index
      @saless = Sale.all
      render json: @saless
    end
  
    def show
      render json: @sales
    end
  
    def create
      @sales = Sale.new(sale_params)
  
      if @sales.save
        render json: @sales, status: :created
      else
        render json: @sales.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @sales.update(sale_params)
        render json: @sales
      else
        render json: @sales.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @sales.destroy
      head :no_content
    end
  
    private
  
    def set_sale
      @sales = Sale.find(params[:id])
    end
  
    def sale_params
      params.require(:sale).permit(:date, :total, :customer_id)
    end
end
