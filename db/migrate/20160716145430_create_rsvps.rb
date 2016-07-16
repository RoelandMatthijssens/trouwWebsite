class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :name1
      t.string :name2
      t.boolean :ceremony
      t.boolean :reception
      t.boolean :diner

      t.timestamps null: false
    end
  end
end
