class ProductsController < InheritedResources::Base
  def index
    @products = Product.all.page(params[:page]).per(3)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def categorized
    @products = Product.where(:type_id => params[:type_id]).page(params[:page]).per(3)
    @order_item = current_order.order_items.new
  end

  def search
    @order_item = current_order.order_items.new
   if params[:search]
     value = params[:search]
     @products = Product.where('name LIKE "%' + value + '%"').order("created_at DESC")
     @products = Product.where('description LIKE "%' + value + '%"').order("created_at DESC")

   else
     @products = Product.order("name").page(params[:page]).per(6)
   end
end



  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock_quantity, :type_id, :image)
    end

end
