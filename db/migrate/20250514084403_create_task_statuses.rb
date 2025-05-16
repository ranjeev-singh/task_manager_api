class CreateTaskStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :task_statuses do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.datetime :update_date
      t.text :description

      t.timestamps
    end
  end
end
