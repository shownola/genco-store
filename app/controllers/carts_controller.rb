class CartsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      flash[:notice] = 'You have successfully created a new cart'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cart = Cart.update(cart_params)
    if @cart.update
      flash[:notice] = 'You have updated your cart'
    else
      render :edit
    end
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to products_path, notice: 'You have deleted this cart'
  end


  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: 'That cart does not exist'
    end

end
