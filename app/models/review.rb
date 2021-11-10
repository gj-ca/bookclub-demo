class Review < ApplicationRecord
  belongs_to :person_who_reviewed, class_name: "User", foreign_key: :reviewer_id
  belongs_to :reviewee, class_name: "User"
end
