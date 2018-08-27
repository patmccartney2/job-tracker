require 'rails_helper'

describe Contact do
  describe 'Validations'do
  end
  describe 'Relationships' do
    it "belongs to a category" do
      company = Company.create(name: "The Creamers")
      contact = Contact.new(name: "The Guy", email: "email@email.com", position: "Huntress", company_id: company.id)
      expect(contact).to respond_to(:company)
    end
  end
end
