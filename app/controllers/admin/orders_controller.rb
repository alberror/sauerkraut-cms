class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: %i[ show edit update destroy ]
  layout "admin"

  def index
    where = {}
    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? [params[:order].split("_")[0].to_sym, params[:order].split("_")[1].to_sym] : [:created_at, :asc]

    @orders = Order.where(where).order(order[0] => order[1])
    authorize @orders
  end

  def show
  end

  def new
    @order = Order.new
    authorize @order
  end

  def edit
  end

  def create
    @order = Order.new(Order_params)
    authorize @order
    
    if @order.save
      redirect_to admin_order_path(@order)
    else
      render :new
    end
  end

  def update
    if @order.update(Order_params)
      redirect_to admin_order_path(@order)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_path
  end

  private
    def set_order
      @order = Order.find(params[:id])
      authorize @order
    end

    def order_params
      params.require(:order).permit(:purchase, :user)
    end
end
