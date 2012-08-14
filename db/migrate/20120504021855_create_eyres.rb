class CreateEyres < ActiveRecord::Migration
  def change
    create_table :eyres do |t|
      t.string   :description
      t.integer  :user_id

      t.timestamps
    end
    add_index :eyres, [:user_id, :created_at]
  end
end
