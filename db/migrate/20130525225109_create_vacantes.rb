class CreateVacantes < ActiveRecord::Migration
  def change
    create_table :vacantes do |t|
      t.text :descripcion
      t.string :titulo
      t.string :area
      t.string :perfil
      t.integer :vistas

      t.timestamps
    end
  end
end
