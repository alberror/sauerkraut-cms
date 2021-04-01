class Admin::ItemsController < Admin::AdminController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :set_item_for_status_change, only: %i[ publish unpublish ]
  layout "admin"

  def index
    where = {}
    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? [params[:order].split("_")[0].to_sym, params[:order].split("_")[1].to_sym] : [:name, :asc]

    @items = Item.where(where).order(order[0] => order[1])
    authorize @items
  end

  def show
  end

  def new
    @item = Item.new
    authorize @item
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path
  end

  def publish
    if @item.update(status: "published")
      flash[:notice] = "Votre projet a bien été publié"
      redirect_back(fallback_location: admin_items_path)
    else
      flash[:error] = "Erreur dans la publication du projet"
    end
  end

  def unpublish
    if @item.update(status: "unpublished")
      flash[:notice] = "Votre projet a bien été publié"
      redirect_back(fallback_location: admin_items_path)
    else
      flash[:error] = "Erreur dans la publication du projet"
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
      authorize @item
    end

    def set_item_for_status_change
      @item = Item.find(params[:item_id])
      authorize @item
    end

    def item_params
      params.require(:item).permit(:name, :slug, :stock, :summary, :thumbnail, :body)
    end
end
