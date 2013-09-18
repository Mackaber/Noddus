class AddDefaulttoUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :pro, :boolean, default: false
    end
  end
end
