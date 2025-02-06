require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { User.create!(username: "Test User", email: "test@example.com", password: "password", password_confirmation: "password") }
  let!(:project) { Project.create!(title: "Test Project", description: "Test description", status: :draft) }


  before do
    sign_in user 
  end

  describe "GET #index" do
    it "assigns @projects and renders index" do
      get :index
      expect(assigns(:projects)).to include(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "assigns @project and renders show" do
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "assigns a new project" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new project and redirects" do
        expect {
          post :create, params: { project: { title: "New Project", description: "New description", status: :draft } }
        }.to change(Project, :count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Project created successfully")
      end
    end

    context "with invalid params" do
      it "redirects the new path" do
        post :create, params: { project: { title: "", description: "Invalid", status: :draft } }
        expect(response).to redirect_to new_project_path
        expect(flash[:alert]).to eq("Error while creating project")
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested project" do
      get :edit, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates the project and redirects" do
        patch :update, params: { id: project.id, project: { title: "Updated Title" } }
        expect(project.reload.title).to eq("Updated Title")
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Project updated successfully")
      end
    end

    context "with invalid params" do
      it "redirect the edit path " do
        patch :update, params: { id: project.id, project: { title: "" } }
        expect(response).to redirect_to(edit_project_path(project))
        expect(flash[:alert]).to eq("Error while updating project")
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the project and redirects" do
      project_to_delete = Project.create!(title: "Delete Me", description: "To be deleted", status: :draft)
      expect {
        delete :destroy, params: { id: project_to_delete.id }
      }.to change(Project, :count).by(-1)
      expect(response).to redirect_to(root_url)
    end
  end
end
