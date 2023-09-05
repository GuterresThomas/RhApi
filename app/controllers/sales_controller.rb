class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :update, :destroy]

  def index
    @sales = Sale.includes(:payment).all # Inclua os pagamentos associados às vendas
    render json: @sales, include: :payment
  end

  def show
    render json: @sales
  end

  def create
    customer = Customer.find_by(id: sale_params[:customer_id])
    if customer
      @sales = Sale.new(sale_params)
      @sales.customer_name = customer.name

      @sales.payment_method = params[:sale][:payment_method]

      if @sales.save
        
        sale_params[:sale_items].each do |sale_item_params|
          sale_item = @sale.sale_items.build(sale_item_params)
          # Calcule o subtotal do sale_item com base na quantidade e preço do produto
          sale_item.subtotal = sale_item.quantity * sale_item.product.price
          sale_item.save
        end


        render json: @sales, status: :created
      else
        render json: @sales.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Cliente não encontrado' }, status: :unprocessable_entity
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
    params.require(:sale).permit(:date, :total, :customer_id, :payment_method)
  end
end
