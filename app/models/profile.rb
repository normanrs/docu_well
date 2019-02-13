class Profile < ActiveRecord
  enum blood_type: [:o_negative, :o_positive, :a_negative, :a_positive, :b_negative, :b_positive, :ab_negative, :ab_positive]
end
