module Api
  class CategoriesController < ApplicationController
    def index
      categories = Category.all
      render json: categories, status: 200
    end

    def create
      category = Category.new(category_params)
      if category.save
        render json: category, status: 201, location: [:api, product]
      else
        render json: category.errors, status: 422
      end
    end

    def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: product
        else
          render json: product.errors, status: :unprocessable_entity
        end
      end

    def destroy
      category = Category.find(params[:id])
      category.destroy!
      render nothing: true, status: 204
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
