class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_maker!, except: [:index, :show]

  def index
    @products = Product.where(maker_id: params[:maker_id])
    @maker = Maker.find_by(id: params[:maker_id])
  end

  def show
    if @product.evaluates.average(:rate) == nil
      @product_score = 0.0
    else
      @product_score = @product.evaluates.average(:rate).round(1)
    end
    @evaluates = Evaluate.where(product_id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.maker_id = current_maker.id
    if @product.save
      redirect_to products_url(maker_id: @product.maker_id), notice: "The product (#{@product.name}) has been registered."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_url(maker_id: @product.maker_id), notice: "The product (#{@product.name}) has been updated."
    else
      render :edit
    end
  end

  def destroy
    if @product.maker == current_maker
      @product.destroy
      redirect_to products_url(maker_id: @product.maker_id), notice: "The product (#{@product.name}) has been deleted."
    else
      redirect_to products_url(maker_id: @product.maker_id), notice: "You don't have permission to delete it."
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :price, :image, :image_cache, :season, :overview
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
