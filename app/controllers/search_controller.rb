class SearchController < ApplicationController

    def index
        @search_results = current_user.customers.ordered
        if search_params[:name].present?
            @search_results = current_user.customers.namee(search_params[:name])
        end

        # if search_params[:payment_status].present?
        #     @search_results = current_user.customers.namee(search_params[:name])
        # end
    end

    private

    def search_params
        params.permit(:name, :payment_status)
    end
end
