class AddMessageReferenceToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :message, null: false, foreign_key: true
  end
end
