# spec/models/project_spec.rb
require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { described_class.create(title: "Unique Project Title", status: :draft) }

  describe "Associations" do
    it "destroys associated comments when the project is destroyed" do
      user =User.create!(username: "Test User", email: "test@example.com", password: "password", password_confirmation:"password")
      project = Project.create!(title: "Test Project", status: :draft)
      comment = project.comments.create!(content: "Test comment", user_id:user.id)

      expect { project.destroy }.to change { Comment.count }.by(-1)
    end
  end

  describe "Validations" do
    it "validates uniqueness of title (case insensitive)" do
      duplicate = described_class.create(title: subject.title, status: :draft)
      subject.valid?  
      duplicate.valid?
      expect(duplicate.errors[:title]).to include("has already been taken")
    end
  end

  describe "Enums" do
    it "defines the correct statuses" do
      expected_statuses = {
        "draft"       => 0,
        "planning"    => 1,
        "in_progress" => 2,
        "review"      => 3,
        "completed"   => 4,
        "archived"    => 5
      }
      expect(Project.statuses).to eq(expected_statuses)
    end

    it "sets the default status" do
      project = Project.new(title: "Test Project")
      expect(project.status).to eq("draft")
    end
  end
end
