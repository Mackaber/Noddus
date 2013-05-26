class AddIndextoVacantes < ActiveRecord::Migration
  def change
    change_table :vacantes do |t|
      t.references :empresa
    end
    add_index :vacantes, :empresa_id
  end
end
