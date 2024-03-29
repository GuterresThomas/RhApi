class EmployeesController < ApplicationController
    def index
        employees = Employee.all
        render json: employees
    end

    def show
        @employees = Employee.find(params[:id])
        render json: employees
    end

    def create
        @employees = Employee.new(employee_params)
        if @employees.save
          render json: @employees
        else
            render json: { error: "Something went wrong" }, status: :unprocessable_entity
        end
    end

    def update
        @employee = Employee.find(params[:id]) # Usar @employee em vez de @employees
        if @employee.update(employee_params)
          render json: @employee # Corrigir para renderizar o funcionário atualizado
        else
          render json: { error: "Something went wrong" }, status: :unprocessable_entity
        end
    end

    def destroy
    
        employees = Employee.find(params[:id])
        employees.destroy
        head :no_content 
    end

    private
  
    def employee_params
    
    params.require(:employee).permit(:name, :birthdate, :gender, :marital_status, :cpf, :address, :phone, :email, :position, :department, :hire_date, :salary)
    
    end

end
