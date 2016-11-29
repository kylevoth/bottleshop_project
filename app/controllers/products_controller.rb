class ProductsController < InheritedResources::Base
  def index
    @products = Product.all
  end


  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock_quantity, :type_id, :image)
    end

end
