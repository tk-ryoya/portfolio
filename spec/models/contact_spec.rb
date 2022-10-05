require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { create(:contact) }

  describe 'バリデーションの確認' do
    it 'お名前が無ければ無効な状態であること' do
      contact = build(:contact, name: nil)
      contact.valid?
      expect(contact.errors[:name]).to include('を入力してください')
    end

    it 'お問い合わせ内容が無ければ無効な状態であること' do
      contact = build(:contact, content: nil)
      contact.valid?
      expect(contact.errors[:content]).to include('を入力してください')
    end

    it 'メールアドレスが無ければ無効な状態であること' do
      contact = build(:contact, email: nil)
      contact.valid?
      expect(contact.errors[:email]).to include('を入力してください')
    end
  end
end
