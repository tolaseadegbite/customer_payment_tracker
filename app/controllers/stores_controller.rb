class StoresController < ApplicationController
    before_action :find_store, only: [:show, :edit, :update, :destroy]
    before_action :set_products, only: [:new, :edit]

    def index
        @stores = Store.ordered
    end

    def show
        
    end

    def new
        @store = Store.new
    end

    def create
        @store = current_user.stores.build(store_params)
        if @store.save
            redirect_to edit_store_url(@store), notice: "Product created successfully, add products to your store"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        if @store.update(store_params)
            flash[:notice] = "Store updated successfully"
            redirect_to store_url(@store)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @store.destroy
        flash[:notice] = "Store has been successfully destroyed"
    end

    private

        def store_params
            params.require(:store).permit(:name, product_ids: [])
        end

        def find_store
            @store ||= Store.find(params[:id])
        end

        def set_products
            @products ||= Product.where(store_id: @store.id).order(:name) + Product.where(store_id: nil)
        end
end
