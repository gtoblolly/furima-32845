require 'rails_helper'

RSpec.describe OrderAddres, type: :model do
  before do
    @order_addres = FactoryBot.build(:order_addres)
  end
  
  describe "購入者情報の保存" do
    context "購入者情報の保存ができるとき" do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order_addres).to be_valid
      end
      it "buildigは空でも保存できること" do
        @order_addres.building = ""
        expect(@order_addres).to be_valid
      end
    end

    context "購入者情報の保存がうまくいかないとき" do
      it "postcodeが空だと保存できない" do
        @order_addres.postcode = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid")
      end
      it "postcokeに-がないと保存できない" do
        @order_addres.postcode = "1239876"
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Postcode is invalid")
      end
      it "area_idが1だと保存できない" do
        @order_addres.area_id = 1
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Area must be other than 1")
      end
      it "cityが空だと保存できない" do
        @order_addres.city = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空だと保存できない" do
        @order_addres.block = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numberが空だと保存できない" do
        @order_addres.phone_number = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Phone number can't be blank", "Phone number is not a number")
      end
      it "phone_nemberが12桁以上だと保存できない" do
        @order_addres.phone_number = "090123456789"
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空だと保存できない" do
        @order_addres.token = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと保存できない" do
        @order_addres.user_id = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと保存できない" do
        @order_addres.item_id = ""
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end