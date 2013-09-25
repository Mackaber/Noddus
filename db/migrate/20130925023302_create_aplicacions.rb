class CreateAplicacions < ActiveRecord::Migration
  def change
    create_table :aplicacions do |t|
      t.references :user
      t.references :vacante
      t.boolean :aceptado

      t.timestamps
    end
    add_index :aplicacions, :user_id
    add_index :aplicacions, :vacante_id
  end
end
