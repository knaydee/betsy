require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET 'new'" do
    it "renders the new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let (:params) do
      {
        user: {
          first_name: "Mister",
          last_name: "Snuffleupagus",
          email: "6@6.com",
          password: "pass"
        }
      }
    end

    let (:bad_params) do
      {
        user: {
          first_name: "Oscar",
          last_name: "The Grouch",
          email: nil,
          password: "pass"
        }
      }
    end

    it "creates a user with good params" do
      last_user = User.last
      post :create, params
      expect(User.last).to_not eq last_user
    end

    it "does not create a user with bad params" do
      last_user  = User.last
      post :create, bad_params
      expect(User.last).to eq last_user
    end
  end

end
