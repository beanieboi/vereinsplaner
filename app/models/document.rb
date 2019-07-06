class Document < ApplicationRecord
  has_one_attached :file
  acts_as_taggable_array_on :tags
end
