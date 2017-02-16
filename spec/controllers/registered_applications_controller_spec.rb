require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:user)  { create(:user) }
  let(:app)   { create(:registered_application) }
  
  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: app.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: app.id}
      expect(response).to render_template :show
    end
    it "assigns registered_application to @registered_application" do
      get :show, {id: app.id}
      expect(assigns(:registered_application)).to eq(app)
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
    
    it "instantiates @registered_application" do
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of RegisteredApplication by 1" do
      expect{post :create, registered_application: {name: Faker::App.name, url: "www#{Faker::App.name}.com"}}.to change(RegisteredApplication,:count).by(1)
    end
    
    it "assigns the new app to @registered_application" do
      post :create, registered_application: {name: Faker::App.name, url: "www#{Faker::App.name}.com"}
      expect(assigns(:registered_application)).to eq RegisteredApplication.last
    end
    
    it "redirects to the new registered_application" do
      post :create, registered_application: {name: Faker::App.name, url: "www#{Faker::App.name}.com"}
      expect(response).to redirect_to RegisteredApplication.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: app.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, {id: app.id}
      expect(response).to render_template :edit
    end
    
    it "assigns app to be updated to @registered_application" do
      get :edit, {id: app.id}
      
      registered_application_instance = assigns(:registered_application)
      
      expect(registered_application_instance.id).to eq app.id
      expect(registered_application_instance.name).to eq app.name
      expect(registered_application_instance.url).to eq app.url
    end
  end

  describe "GET update" do
    it "updates post with expected attributes" do
      new_name = Faker::App.name
      new_url = Faker::App.name
      
      put :update, id: app.id, registered_application: {name: new_name, url: new_url}
      
      updated_app = assigns(:registered_application)
      expect(updated_app.id).to eq app.id
      expect(updated_app.name).to eq new_name
      expect(updated_app.url).to eq new_url
    end
    
    it "redirects to the updated wiki" do
      new_name = Faker::App.name
      new_url = Faker::App.name
      
      put :update, id: app.id, registered_application: {name: new_name, url: new_url}
      expect(response).to redirect_to app
    end
  end
  
  describe "GET destroy" do
    it "deletes the registered application" do
      delete :destroy, {id: app.id}
      
      count = RegisteredApplication.where({id: app.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to registered_application index" do
      delete :destroy, {id: app.id}
      
      expect(response).to redirect_to registered_applications_path
    end
  end

end
