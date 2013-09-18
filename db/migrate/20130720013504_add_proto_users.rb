class AddProtoUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :pro
    end
  end
end
