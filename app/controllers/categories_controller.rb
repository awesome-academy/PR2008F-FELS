class CategoriesController < ApplicationController
   def index
    @categories =
      if params[:term].nil?
        Array.new
      else
        Category.search params[:term]
      end
  end
end
