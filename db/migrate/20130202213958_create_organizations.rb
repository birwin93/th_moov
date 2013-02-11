class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end

    add_index :organizations, :name
    add_index :organizations, :remember_token
  end
end
