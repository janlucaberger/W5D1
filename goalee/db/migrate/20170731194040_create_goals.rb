class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.boolean :private, default: false
      t.boolean :completed, default: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :goals, :user_id

  end
end
