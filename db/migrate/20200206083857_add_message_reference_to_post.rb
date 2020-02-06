class AddMessageReferenceToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :message, foreign_key: true
  end
end
