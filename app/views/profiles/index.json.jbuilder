json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :city, :speciality
  json.url profile_url(profile, format: :json)
end
