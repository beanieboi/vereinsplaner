class Payment < ApplicationRecord
  has_paper_trail

  belongs_to :member
  belongs_to :created_by, class_name: 'User'
end
