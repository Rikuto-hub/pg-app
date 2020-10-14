require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let!(:user) { create(:user) }
  let!(:language) { create(:language, user: user) }

  context 'titiel,error,numberが入力されている場合' do
    let!(:article) { create(:article, language: language) }

    it '記事が保存される' do
      expect(article).to be_valid
    end
  end  
end
