class PostCategory < ApplicationRecord
  has_many :posts, class_name: 'PostComment'
end
