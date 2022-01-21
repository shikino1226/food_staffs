require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  let(:user) { create(:user) }

  describe 'バリデーションのテスト' do
    it 'ユーザー登録にバリデーションがかかること' do
      expect(user).to be_valid
    end

    it '名前がなければユーザー登録できないこと' do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  end
end
