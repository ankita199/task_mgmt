json.extract! task, :id, :project_id, :name, :description, :status, :user_id, :start_date, :end_date, :created_at, :updated_at
json.url task_url(task, format: :json)
