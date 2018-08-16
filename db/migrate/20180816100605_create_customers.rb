class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email, index: true
      t.string :name, index: true
      t.timestamps
    end
  end
end
