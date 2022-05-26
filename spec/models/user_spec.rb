require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
     it "全項目を正しく記述すれば登録ができる" do
      expect(@user).to be_valid
     end
    end

    context "新規登録できないとき" do
     it "nicknameがないと登録できない"
     end

     it "emailがないと登録できない"
     end

     it "emailが重複すると登録できない"
     end

     it "emailに@が存在しないと登録できない"
     end

     it "passwordが存在しないと登録できない"
     end

     it "passwordが6文字未満だと登録できない"
     end

     it "passwordが半角英数字混合でなければ登録できない"
     end

     it "passwordとpassword_confirmationが一致しない場合登録できない"
     end

     it "first/last_name_kanjiが存在しないと登録できない"
     end

     it "first/last_name_kanjiが全角で入力しないと登録できない"
     end

     it "first/last_name_kanaが存在しないと登録できない"
     end

     it "first/last_name_kanaが全角カタカナで入力しないと登録できない"
     end

     it "生年月日が存在しないと登録できない"
     end

    end
  end
end
