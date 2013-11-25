class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: true
      t.index :name, unique: true
    end
  end
end
