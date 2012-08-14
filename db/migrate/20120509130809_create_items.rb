class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :process
      t.string :group
      t.string :status
      t.date   :last
      t.text   :obs
      t.integer :eyre_id
      
      t.timestamps
    end
  add_index :items, [:eyre_id]
  end
end
