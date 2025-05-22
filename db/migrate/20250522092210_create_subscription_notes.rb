class CreateSubscriptionNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :subscription_notes do |t|
      t.integer :subscription_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
