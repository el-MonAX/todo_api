json.extract! task, :id, :name, :completed, :comments, :created_at, :updated_at
json.url api_v1_task_url(task, format: :json)
