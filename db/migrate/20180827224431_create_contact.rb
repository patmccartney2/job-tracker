class CreateContact < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :position
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
