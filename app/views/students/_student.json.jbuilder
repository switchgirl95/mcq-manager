json.extract! student, :id, :matricule, :nom, :prenoms, :password, :id_clazz, :created_at, :updated_at
json.url student_url(student, format: :json)
