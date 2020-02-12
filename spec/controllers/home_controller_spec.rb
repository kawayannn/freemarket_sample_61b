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
      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end
      it 'ログイン中' do
        expect(response).to render_template :index
      end
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