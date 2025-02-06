require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { User.create!(username: "Test User", email: "test@example.com", password: "password", password_confirmation: "password") }
  let(:project) { Project.create!(title: "Test Project", description: "Test description", status: :draft) }

  before do
    sign_in user
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new comment and redirects to the project page" do
        expect {
          post :create, params: { project_id: project.id, comment: { content: "This is a comment" } }
        }.to change(project.comments, :count).by(1)
        expect(response).to redirect_to(project)
        expect(flash[:notice]).to eq("Comment created successfully") # You can add this if you're redirecting with flash
      end
    end

    context "with invalid params" do
      it "does not create a comment and redirects to the project page with an alert" do
        expect {
          post :create, params: { project_id: project.id, comment: { content: "" } }
        }.not_to change(project.comments, :count)
        expect(response).to redirect_to(project)
        expect(flash[:alert]).to eq("Comment could not be created")
      end
    end
  end
end

