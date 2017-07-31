require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "GET#new" do
    before(:each) do
      get :new
    end
    it { should render_template(:new) }
    it { should respond_with(200) }

  end

  describe "POST#create" do
    context "with VALID params" do

    before(:each) do
      post :create,
        params: {
          user: { username: "Bob", password: "thebuilder"}
        },
        flash: {}
    end


      it { should respond_with(302) }
      it { should redirect_to(user_url(User.last.id))}

      # TODO: add redirect_to goals page
      # TODO: add rspec to check if user is logged in
    end

    context "with INVALID params" do
      before(:each) do
        post :create,
          params: {
            user: { username: "Bob", password: "t"}
          },
          flash: {}
      end
      it { should redirect_to(new_user_url) }
    end

  end

  describe "GET#show" do
    before(:each) do
      get :show
    end
  end



end
