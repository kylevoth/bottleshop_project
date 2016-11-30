class ProductsController < InheritedResources::Base
  def index
    @products = Product.all.order("name").page(params[:page]).per(3)
  end

  def show
    @product = Product.find(params[:id])
  end

  def categorized
    @products = Product.where(:type_id => params[:type_id]).page(params[:page]).per(3)
  end

  def search
   if params[:search]
     value = params[:search]
     @products = Product.where('name LIKE "%' + value + '%"').order("created_at DESC")

   else
     @products = Product.order("name").page(params[:page]).per(6)
   end
end


  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock_quantity, :type_id, :image)
    end

end
