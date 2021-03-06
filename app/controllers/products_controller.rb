class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order('created_at desc')
  end

  def new
    @product = Product.new    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'You have successfully created a new product'
      redirect_to @product
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'This product has been updated'
      redirect_to products_path(@product)
    else
      flash[:danger] = 'There was an error updating this product'
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'You have deleted this product'
  end



  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :cost, :image, :uses)
  end

  def set_product
    @product = Product.find(params[:id])
  end



end
