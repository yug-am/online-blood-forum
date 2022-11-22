json.extract! request, :id, :requestorId, :bloodType, :location, :isConfirmed, :allocationCode, :created_at, :updated_at
json.url request_url(request, format: :json)
