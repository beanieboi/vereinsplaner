class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :created_by, class_name: 'User'
end
