require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:my_list) { List.create!(title: "My List Title", body: "My list body") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @list" do
      get :new
      expect(assigns(:list)).not_to be_nil
    end
  end


  describe "POST create" do
    it "increases the number of List by 1" do
      expect{ post :create, params: { list: {title: "My List Title", body: "My list body"} } }.to change(List,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, params: { list: {title: "My List Title", body: "My list body"} }
      expect(assigns(:list)).to eq List.last
    end

    it "redirects to the new list" do
      post :create, params: { list: {title: "My List Title", body: "My list body"} }
      expect(response).to redirect_to List.last
    end
  end

end