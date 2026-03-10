json.extract! patient, :id, :user_id, :name, :birth_date, :email, :phone, :description, :created_at, :updated_at
json.url patient_url(patient, format: :json)
