class ProductItemDatesController < ApplicationController
    before_action :set_customer
    before_action :set_product_item_date, only: [:edit, :update, :destroy]

    def new
        @product_item_date = ProductItemDate.new
    end

    def create
        @product_item_date = @customer.product_item_dates.build(product_item_date_params)
        @product_item_date.user = current_user
        if @product_item_date.save
            respond_to do |format|
                format.html { redirect_to customer_path(@customer), notice: "Date was successfully created." }
                format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        @product_item_date.user = current_user
        if @product_item_date.update(product_item_date_params)
            respond_to do |format|
                format.html { redirect_to customer_path(@customer), notice: "Date was successfully updated." }
                format.turbo_stream { flash.now[:notice] = "Date was successfully updated." }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product_item_date.destroy
        respond_to do |format|
            format.html { redirect_to customer_path(@customer), notice: "Date was successfully destroyed." }
            format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
        end
    end


    private

    def set_product_item_date
        @product_item_date ||= @customer.product_item_dates.find(params[:id])
    end

    def product_item_date_params
        params.require(:product_item_date).permit(:date)
    end
    
    def set_customer
        @customer ||= current_user.customers.find(params[:customer_id])
    end

end