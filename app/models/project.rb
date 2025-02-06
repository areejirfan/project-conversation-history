class Project < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, uniqueness: { case_sensitive: false }, presence: true
    enum :status, [ :draft, :planning, :in_progress, :review, :completed, :archived ], default: :draft
end


  

  