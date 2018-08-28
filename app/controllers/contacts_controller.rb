class ContactsController < ApplicationController
  def create
    company = Company.find(params[:company_id])
    contact = company.contacts.create(contact_params)
    redirect_to company_path(company)
  end

  def edit
    @contact = Contact.find(params[:id])
    @company = @contact.company
  end

  def destroy
    company = Company.find(params[:company_id])
    contact = Contact.find(params[:id])
    contact.destroy

    flash[:success] = "#{contact.name} was successfully deleted!"
    redirect_to company_path(company)
  end

  def update
    company = Company.find(params[:company_id])
    contact = company.contacts.update(contact_params)
    redirect_to company_path(company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :position)
  end
end
