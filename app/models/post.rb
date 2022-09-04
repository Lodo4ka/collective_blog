class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :post_category
end
