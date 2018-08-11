class CreateEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiries do |t|
      t.string :name, index: true
      t.string :email, index: true
      t.string :source, limit: 64, index: true
      t.text :message
      t.text :addon
      t.string :status
      t.jsonb :error

      t.timestamps
    end
  end
end
