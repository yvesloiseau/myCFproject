require 'rails_helper'

describe UsersController, :type => :controller do
  context 'Validate sign in page' do
    # Create users
    let(:user)  { User.create!(email: "interface_yves@hotmail.com",
                               password: "guylou1",
                               first_name: "Yves",
                               last_name: "Loiseau") }
    let(:user2)  { User.create!(email: "glefebvre17@yahoo.com",
                               password: "guylou1",
                               first_name: "Guylaine",
                               last_name: "Lefebvre") }

    describe 'Get #show' do
      context 'user is looged in' do
        before do
          sign_in user
        end
        it "loads correct user details" do
          get :show, params: { id: user.id }
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq user
        end
      end

      context 'no user is logged in' do
        it 'redirects to login' do
          #get :show, id: user.id  This instructions will be depricated in Rails 5.1
          get :show, params: { id: user.id }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'user trying to edit another user' do
        before do
          sign_in user2
        end
        it "re-directs to root page" do
          get :edit, params: { id: user.id }
          expect(response).to redirect_to(root_path)
        end
      end

      context 'user trying to display another show page' do
        before do
          sign_in user2
        end
        it "re-directs to root page" do
          get :show, params: { id: user.id }
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end