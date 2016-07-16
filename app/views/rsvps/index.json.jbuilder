json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :name1, :name2, :ceremony, :reception, :diner
  json.url rsvp_url(rsvp, format: :json)
end
