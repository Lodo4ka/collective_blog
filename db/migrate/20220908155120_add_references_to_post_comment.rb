# frozen_string_literal: true

class AddReferencesToPostComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_comments, :post, foreign_key: true, null: false, default: false
  end
end
