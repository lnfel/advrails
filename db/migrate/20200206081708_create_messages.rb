class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
    	t.belongs_to :post
    	t.text :message_body
    	t.string :sender_email

      t.timestamps
    end
  end
end
