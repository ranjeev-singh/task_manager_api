class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :external_id
      t.string :currency
      t.text :remarks
      t.string :status

      t.timestamps
    end
  end
end
