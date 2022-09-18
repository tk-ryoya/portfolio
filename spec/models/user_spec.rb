require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'バリデーションの確認' do
    it '姓が無ければ無効な状態であること' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include('を入力してください')
    end
    it '名が無ければ無効な状態であること' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include('を入力してください')
    end
    it '姓(フリガナ)が無ければ無効な状態であること' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include('を入力してください')
    end
    it '名(フリガナ)が無ければ無効な状態であること' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include('を入力してください')
    end
    it '電話番号が無ければ無効な状態であること' do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include('を入力してください')
    end
    it 'メールアドレスが無ければ無効な状態であること' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
    it '重複したメールアドレスなら無効な状態であること' do
      create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end
  end
end
