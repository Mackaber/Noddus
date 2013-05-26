class AddRolesAndstatusToUsers < ActiveRecord::Migration
  def change

    change_table :users do |t|
      t.string :rol
      t.string :status
    end
  end
end
