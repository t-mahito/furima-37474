require 'rails_helper'

RSpec.describe ShoppingForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, :a)
    @shopping_form = FactoryBot.build(:shopping_form, user_id: user.id, item_id: item.id)
    sleep 2
  end
  
   describe "商品購入" do
    context "商品購入できるとき" do
      it "全項目を正しく記入すれば購入できる" do
        expect(@shopping_form).to be_valid
      end

      it "building_name(建物名)は未記入であっても購入ができる" do
        @shopping_form.building_name = ""
        expect(@shopping_form).to be_valid
      end
    end

    context "商品購入できないとき" do
      it "postal_code(郵便番号)が未記入だと購入できない" do
        @shopping_form.postal_code =""
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code can't be blank", "Postal code is invalid"
      end

      it "postal_code(郵便番号}が全角かなだと購入できない" do
        @shopping_form.postal_code ="いちまんごせん"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号}が全角カナだと購入できない" do
        @shopping_form.postal_code ="イチマンゴセン"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号}が漢字だと購入できない" do
        @shopping_form.postal_code ="零一二三四五六七"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号}が全角数字だと購入できない" do
        @shopping_form.postal_code ="０１２−３４５６"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、8文字以上では購入できない" do
        @shopping_form.postal_code ="012-34567"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、7文字未満では購入できない" do
        @shopping_form.postal_code ="012-345"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、「-」が含まれていないと購入できない" do
        @shopping_form.postal_code ="0123456"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、半角数字1つ、-、半角数字6つ(0-123456)では購入できない" do
        @shopping_form.postal_code ="0-123456"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、半角数字2つ、-、半角数字5つ(01-23456)では購入できない" do
        @shopping_form.postal_code ="01-23456"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、半角数字4つ、-、半角数字3つ(0123-456)では購入できない" do
        @shopping_form.postal_code ="0123-456"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、半角数字5つ、-、半角数字2つ(01234-56)では購入できない" do
        @shopping_form.postal_code ="01234-56"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "postal_code(郵便番号)が半角数字でも、半角数字6つ、-、半角数字1つ(012345-6)では購入できない" do
        @shopping_form.postal_code ="012345-6"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Postal code is invalid"
      end

      it "area_id(都道府県)が1(未選択)では購入できない" do
        @shopping_form.area_id ="1"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Area can't be blank"     
      end

      it "city(市区町村)が未記入だと購入できない" do
        @shopping_form.city =""
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "City can't be blank"
      end

      it "address(番地)が未記入だと購入できない" do
        @shopping_form.address =""
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Address can't be blank"
      end

      it "phone_number(電話番号)が未記入だと購入できない" do
        @shopping_form.phone_number =""
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid"
      end

      it "phone_number(電話番号)が全角数字だと購入できない" do
        @shopping_form.phone_number ="０１２３４５６７８９"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_number(電話番号)が全角かなだと購入できない" do
        @shopping_form.phone_number ="いちまんごせんきゅう"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_number(電話番号)が全角カナだと購入できない" do
        @shopping_form.phone_number ="イチマンゴセンキュウ"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_number(電話番号)が漢字だと購入できない" do
        @shopping_form.phone_number ="零一二三四五六七八九"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_number(電話番号)が半角数字でも、10文字未満だと購入できない" do
        @shopping_form.phone_number ="012345678"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_number(電話番号)が半角数字でも、12文字以上だと購入できない" do
        @shopping_form.phone_number ="012345678901"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_number(電話番号)が半角数字でも、「-」が含まれると購入できない" do
        @shopping_form.phone_number ="01-2345-678"
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Phone number is invalid"
      end

      it "tokenが空だと購入できない" do
        @shopping_form.token =""
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Token can't be blank"
      end

      it "userが紐づいていないと購入できない" do
        @shopping_form.user_id = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "User can't be blank"
      end

      it "itemが紐づいていないと購入できない" do
        @shopping_form.item_id = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include "Item can't be blank"
      end

    end
  end 
end