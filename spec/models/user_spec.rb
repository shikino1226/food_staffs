require 'rails_helper'

describe User do
  describe 'Userテスト' do
    it 'ユーザー登録にバリデーションがかかること' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it 'アドレスがなければユーザー登録できないこと' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  end
end
