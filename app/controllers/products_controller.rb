class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  before_action :authenticate_user!, only: [:new, :create]

  before_action :only => [:edit, :update, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all
    end
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to  products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to root_path
  end

  # def upvote
  #   @product = Product.find(params[:id])
  #   @product.upvote_by current_user
  #   @products = Product.all
  #   redirect_to products_path
  # end
  #
  # def downvote
  #   @product = Product.find(params[:id])
  #   @product.downvote_by current_user
  #   @products = Product.all
  #   redirect_to products_path
  # end

  private
  def product_params
    params.require(:product).permit(:title, :image, :description, :author, :contributor, :image, :publisher, :pages, :amazon_product_url, :price) ## Rails 4 strong params usage
  end
end
