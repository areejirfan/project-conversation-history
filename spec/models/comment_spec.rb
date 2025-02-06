require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(username: "Test User", email: "test@example.com", password: "password") }
  let(:project) { Project.create!(title: "Test Project", status: :draft) }

  describe "Associations" do
    it "belongs to a user" do
      comment = Comment.new(content: "Test comment", user: user, project: project)
      expect(comment.user).to eq(user)
    end

    it "belongs to a project" do
      comment = Comment.new(content: "Test comment", user: user, project: project)
      expect(comment.project).to eq(project)
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      comment = Comment.new(content: "This is a test comment", user: user, project: project)
      expect(comment).to be_valid
    end

    it "is invalid without content" do
      comment = Comment.new(content: nil, user: user, project: project)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it "is invalid without a user" do
      comment = Comment.new(content: "Test comment", user: nil, project: project)
      expect(comment).not_to be_valid
      expect(comment.errors[:user]).to include("must exist")
    end

    it "is invalid without a project" do
      comment = Comment.new(content: "Test comment", user: user, project: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:project]).to include("must exist")
    end
  end
end
