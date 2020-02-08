require 'rails_helper'

describe HomeController, type: :controller do
  let(:user) { create(:user) }
  let(:address){ create(:address)}
  # userをcreateし、let内に格納

  describe '#index' do
    context 'log in' do
      before do
        login user
        get :index, params: { user_id: user.id }
      end
# この中にログインしている場合のテストを記述
      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
# この中にログインしていない場合のテストを記述
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end