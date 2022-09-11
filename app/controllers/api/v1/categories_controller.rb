class Api::V1::CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: categories, status: 200
    end

    def create
        category = Category.new(category_params)
        if category.save
            render json: category, status: 200
        else
            render json: {errors: "Category was not created!"}, status: :unprocessable_entity
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :decription, :image)
    end
end