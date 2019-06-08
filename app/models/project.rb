class Project < ApplicationRecord
      has_and_belongs_to_many :users
      has_many :tasks
      has_many :comments, :through => :tasks
      validates :name,:description, presence: true
end
