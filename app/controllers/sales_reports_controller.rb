class SalesReportsController < ApplicationController
    before_action :set_sales_report, only: [:show, :update, :destroy]
    
    def index
        @sales_reports = SalesReport.all
        render json: @sales_reports
    end
    
    def show
        render json: @sales_report
    end
    
    def create
        @sales_report = SalesReport.new(sales_report_params)
    
        if @sales_report.save
        render json: @sales_report, status: :created
        else
        render json: @sales_report.errors, status: :unprocessable_entity
        end
    end
    
    def update
        if @sales_report.update(sales_report_params)
        render json: @sales_report
        else
        render json: @sales_report.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @sales_report.destroy
        head :no_content
    end
    
    private
    
    def set_sales_report
        @sales_report = SalesReport.find(params[:id])
    end
    
    def sales_report_params
        params.require(:sales_report).permit(:report_date, :total_sales, :transaction_count)
    end      
end
