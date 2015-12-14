require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:order_item)do
    OrderItem.create(quantity: 12, order_id: 1, product_id: 6)
  end

  describe "POST 'create'" do

  end

  describe "GET 'cart'" do
    it "renders the cart view" do
      get :cart
      expect(subject).to render_template :cart, { :id => 1 }
    end
  end

  describe "PATCH 'update'" do

    let(:params) do
      {
        order_item: {
          quantity: 12,
          order_id: 1,
          product_id: 6
        },
        id: order_item.id
      }
      end

      before :each do
        session[:user_id] = user.id
      end

      it "updates the order item with good params" do
        before_update = order_item.attributes
        patch :update, params, id: order_item.id
        order_item.reload
        expect(order_item.attributes).to_not eq before_update
      end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
          {
            id: order_item.id
          }
    end

    it "deletes an order_item" do
      expect(OrderItem.all).to include(order_item)
      delete :destroy, params
      expect(OrderItem.all).to_not include(order_item)
    end
  end

end
