module Api
  class ProductsController < ApplicationController
    def index
      products = Product.all
      render json: products, status: 200
    end

    def create
      product = Product.new(product_params)
      if product.save
        render json: product, status: 201, location: [:api, product]
      else
        render json: product.errors, status: 422
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
      product = Product.find(params[:id])
      product.destroy!
      render nothing: true, status: 204
    end

    private

    def product_params
      params.require(:product).permit(:title, :description, :price, :shine, :faces, :rarity, :color)
    end
  end
end
