class AddDefaultStatusToUsersAndVacantes < ActiveRecord::Migration
  def change
    change_column :users, :status, :string, :default => "disponible"
    change_column :vacantes, :status, :string, :default => "disponible"
  end
end
