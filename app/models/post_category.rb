# frozen_string_literal: true

class PostCategory < ApplicationRecord
  has_many :posts, class_name: 'PostComment', dependent: false
end
