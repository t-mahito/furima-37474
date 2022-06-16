require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe "オーダーリスト登録" do
    context "オーダーリストに登録できるとき" do
      it "userとitemが存在すれば登録できる" do
       expect(@order).to be_valid
      end
    end

    context "オーダーリストに登録できないとき" do
      it "userが存在しないと登録できない" do
       @order.user = nil
       @order.valid?
       expect(@order.errors.full_messages).to include "User must exist"
      end

      it "itemが存在しないと登録できない" do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item must exist"
      end
    end
  end
end