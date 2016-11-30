class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :city
      t.string :phone
      t.string :email
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
