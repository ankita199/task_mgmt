class Task < ApplicationRecord
    enum status: [ :inprogress,:hold, :complete ]
    validates :name,:user_id,:project_id, presence: true
    validate :end_date_is_after_start_date

    belongs_to :project
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :parent_replies, -> (parent_comment_id) { where(parent_comment_id: nil) }, class_name: "Comment",foreign_key: "task_id"
  
 
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
  
    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date") 
    end 
  end
end
