require 'rails_helper'
describe Item do
  describe '#create' do
    context 'can not save' do
      it "nameが空だと登録できない" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      it "priceが300未満だと登録できない" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("must be greater than 300")
      end
      it "priceが9999999を超えると登録できない" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 9999999")
      end
    end
  end
end