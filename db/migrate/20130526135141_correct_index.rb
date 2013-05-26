class CorrectIndex < ActiveRecord::Migration
  def change
    change_table :vacantes do |t|
      t.references :user
    end
    add_index :vacantes, :user_id
  end
end
