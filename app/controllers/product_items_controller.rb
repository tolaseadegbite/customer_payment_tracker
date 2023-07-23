class ProductItemsController < ApplicationController
    before_action :set_customer
    before_action :set_product_item_date
    before_action :set_product_item, only: [:edit, :update, :destroy]
  
    def new
      @product_item = @product_item_date.product_items.build
      @product_item.payments.build
    end
  
    def create
      @product_item = @product_item_date.product_items.build(product_item_params)
  
      if @product_item.save
        respond_to do |format|
            format.html { redirect_to customer_path(@customer), notice: "Item was successfully created." }
            format.turbo_stream { flash.now[:notice] = "Item was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @product_item.payments.build
    end
  
    def update
        if @product_item.update(product_item_params)
          respond_to do |format|
            format.html { redirect_to customer_path(@customer), notice: "Item was successfully updated." }
            format.turbo_stream { flash.now[:notice] = "Item was successfully updated." }
          end
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
      @product_item.destroy

      respond_to do |format|
        format.html { redirect_to customer_path(@customer), notice: "Date was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully destroyed." }
      end
    end
  
    private

    def set_product_item
        @product_item = @product_item_date.product_items.find(params[:id])
    end
  
    def product_item_params
      params.require(:product_item).permit(:name, :description, :quantity, :unit_price, :payment_status, payments_attributes: [:id, :_destroy, :amount, :date])
    end
  
    def set_customer
      @customer = current_user.customers.find(params[:customer_id])
    end
  
    def set_product_item_date
      @product_item_date = @customer.product_item_dates.find(params[:product_item_date_id])
    end
end
