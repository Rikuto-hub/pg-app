require 'rails_helper'

RSpec.describe "Languages", type: :request do
  let!(:user) { create(:user) }
  let!(:languages) { create_list(:language, 5, user: user) }

  describe "GET /languages" do

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it "200statusが帰ってくる" do
        get languages_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /languages" do

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it "記事が保存される" do
        language_params = attributes_for(:language)
        post languages_path({language: language_params})
        expect(response).to have_http_status(302)
        expect(Language.last.title).to eq(language_params[:title])
        expect(Language.last.language).to eq(language_params[:language])
      end
    end 

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        language_params = attributes_for(:language)
        post languages_path({language: language_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
