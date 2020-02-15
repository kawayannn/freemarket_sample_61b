require 'rails_helper'
describe Phone do
  describe '#create' do
    it "phonenumberが空だと登録できない" do
      phone = build(:phone, phonenumber: nil)
      
      phone.valid?
      expect(phone.errors[:phonenumber]).to include("can't be blank")
    end
  end
end
