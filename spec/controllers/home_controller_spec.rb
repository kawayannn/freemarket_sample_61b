require 'rails_helper'

describe HomeController, type: :controller do
  let(:user) { create(:user) }
  let(:phone){ create(:phone)}
  # userをcreateし、let内に格納

  describe '#index' do
    context 'ログイン中' do
      before do
        login user
        get :index, params: { user_id: user.id }
      end
      it 'renders index' do
        expect(response).to render_template :index
      end
    end
    context 'not log in' do
      before do
        get :index, params: { user_id: user.id }
      end
      it 'ログアウト中' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end