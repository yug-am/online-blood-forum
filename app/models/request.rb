class Request < ApplicationRecord
  validates :location, presence: true
  BLOOD_GROUP_LIST= [ "O+",  "O-", "A+", "A-", "B+", "B-", "AB+", "AB-","Other" ]
  LOCATION_LIST=["IIM KozhiKode", "NIT Calicut", "KMCT", "Baby Memorial Hospital", "Nirmala Hospital" ]
end
