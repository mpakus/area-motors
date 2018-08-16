class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :customer
      t.text :description
      t.timestamps
    end
  end
end
