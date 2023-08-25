class CashRegistersController < ApplicationController
    before_action :set_cash_register, only: [:show, :update, :destroy]
    
    def index
        @cash_registers = CashRegister.all
        render json: @cash_registers
    end
    
    def show
        render json: @cash_register
    end
    
    def create
        @cash_register = CashRegister.new(cash_register_params)
    
        if @cash_register.save
        render json: @cash_register, status: :created
        else
        render json: @cash_register.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if @cash_register.update(cash_register_params)
        render json: @cash_register
        else
        render json: @cash_register.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @cash_register.destroy
        head :no_content
    end
    
    private
    
    def set_cash_register
        @cash_register = CashRegister.find(params[:id])
    end
    
    def cash_register_params
        params.require(:cash_register).permit(:starting_balance, :ending_balance)
    end
        
end
