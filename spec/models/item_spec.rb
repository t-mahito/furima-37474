require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item, :a)
  end

  describe "アイテム新規出品登録" do
    context "新規出品登録できるとき"do
     it "全項目を正しく記述すれば登録ができる" do
      expect(@item).to be_valid
     end
    end

    context "新規出品登録できないとき" do
     it "nameがないと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
     end

     it "textがないと登録できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
     end

     it "category_idが1(未選択）であると登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
     end

     it "condition_idが1(未選択）であると登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
     end

     it "charge_idが1(未選択）であると登録できない" do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Charge can't be blank"
     end

     it "area_idが1(未選択）であると登録できない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
     end

     it "delivery_idが1(未選択）であると登録できない" do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery can't be blank"
     end

     it "priceがひらがなだと登録できない" do
      @item.price = "いちまん"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
     end

     it "priceがカタカナだと登録できない" do
      @item.price = "イチマン"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
     end

     it "priceが漢字だと登録できない" do
      @item.price = "一万"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
     end

     it "priceが英語だと登録できない" do
      @item.price = "thousand"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
     end

     it "priceが全角数字だと登録できない" do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
     end

     it "priceが半角数字且つ数値が300未満だと登録できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
     end

     it "priceが半角数字且つ数値が1000000以上だと登録できない" do
      @item.price = 20000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
     end

     it "user_idが存在しないと登録できない" do
      @item_nouser = FactoryBot.build(:item, :c)
      @item_nouser.valid?
      expect(@item_nouser.errors.full_messages).to include "User must exist"
     end

     it "imageが存在しないと登録できない" do
      @item_noimage = FactoryBot.build(:item, :b)
      @item_noimage.valid?
      expect(@item_noimage.errors.full_messages).to include "Image can't be blank"
     end
    end
  end
end
