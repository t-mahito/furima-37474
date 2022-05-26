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
     it "nicknameがないと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end

     it "emailがないと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end

     it "emailが重複すると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
     end

     it "emailに@が存在しないと登録できない" do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
     end

     it "passwordが存在しないと登録できない" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
     end

     it "passwordが5文字未満だと登録できない" do
      @user.password = "@mail"
      @user.password_confirmation = "@mail"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end

     it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Passwordには半角英数字混合で入力してください"
     end

     it "passwordとpassword_confirmationが一致しない場合登録できない" do
      @user.password = "testtest12"
      @user.password_confirmation = "testtest13"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

     it "first_name_kanjiが存在しないと登録できない" do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kanji can't be blank"
     end

     it "last_name_kanjiが存在しないと登録できない" do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
     end

     it "first_name_kanjiが全角で入力しないと登録できない" do
      @user.first_name_kanji = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kanji お名前には全角文字を使用してください"
     end

     it "last_name_kanjiが全角で入力しないと登録できない" do
      @user.last_name_kanji = "ichiro"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kanji お名前には全角文字を使用してください"
     end
    
     it "first_name_kanaが存在しないと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end

     it "last_name_kanaが存在しないと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end


     it "first_name_kanaが全角カタカナで入力しないと登録できない" do
      @user.first_name_kana = "やマda"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana お名前[カナ]には全角カタカナを使用してください"
     end

     it "last_name_kanaが全角カタカナで入力しないと登録できない" do
      @user.last_name_kana = "一ロう"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana お名前[カナ]には全角カタカナを使用してください"
     end


     it "生年月日が存在しないと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end

    end
  end
end
