require 'rails_helper'
describe Address do
  describe '#create' do
    it "phonenumberが空だと登録できない" do
      address = build(:address, phonenumber: nil)
      address.valid?
      expect(address.errors[:phonenumber]).to include("can't be blank")
    end
  end
end
