class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :edit, :update, :destroy]

    def index
        @customers = current_user.customers.ordered
    end

    def show
        @product_item_dates = @customer.product_item_dates.includes(:product_items).ordered
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = current_user.customers.build(customer_params)
        if @customer.save
            respond_to do |format|
                format.html { redirect_to customers_url, notice: 'Customer was successfully created' }
                format.turbo_stream { flash.now[:notice] = "Customer was successfully created" }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        if @customer.update(customer_params)
            respond_to do |format|
                format.html { redirect_to customers_url, notice: 'Customer was successfully updated' }
                format.turbo_stream { flash.now[:notice] = "Customer was successfully updated" }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @customer.destroy
        respond_to do |format|
            format.html { redirect_to customers_url, notice: 'Customer was successfully deleted' }
            # format.turbo_stream { flash.now[:notice] = "Customer was successfully deleted" }
        end
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :phone_number)
    end

    def set_customer
        @customer ||= current_user.customers.find(params[:id])
    end
end
