require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    it 'ユーザー登録にバリデーションがかかること' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it '名前がなければユーザー登録できないこと' do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  end
end
