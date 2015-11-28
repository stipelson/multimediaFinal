json.array!(@mascota) do |mascotum|
  json.extract! mascotum, :id, :sexo, :edad, :tamano, :raza
  json.url mascotum_url(mascotum, format: :json)
end
