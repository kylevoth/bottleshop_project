class AboutControllerController < ApplicationController
  def index
    @about = About.first
  end

  private

    def product_params
      params.require(:about).permit(:body)
    end
end
