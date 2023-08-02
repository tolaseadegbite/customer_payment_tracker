class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def show
        
    end

    def new
        @product = Product.new
    end

    def create
        @product = current_user.products.build(product_params)
        if @product.save
            flash[:notice] = "Product created successfully"
            redirect_to @product
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        if @product.update(product_params)
            flash[:notice] = "Product updated successfully"
            redirect_to product_url(@product)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product.destroy
        flash[:notice] = "Product has been successfully destroyed"
    end

    private

        def product_params
            params.require(:product).permit(:name, :quantity, :code, :unit_price, :description)
        end

        def set_product
            @product ||= Product.find(params[:id])
        end
end
