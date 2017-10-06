json.extract! teacher, :id, :nom, :prenoms, :password, :status, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
