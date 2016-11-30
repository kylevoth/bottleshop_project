class ContactsController < InheritedResources::Base

  def index
    @contact = Contact.first
  end



  private

    def contact_params
      params.require(:contact).permit(:address, :city, :phone, :email, :province_id)
    end

end
