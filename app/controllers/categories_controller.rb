class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def search
        if params[:q].nil?
          @categories = []
        else
          @categories = Category.search params[:q]
        end
      end

end
