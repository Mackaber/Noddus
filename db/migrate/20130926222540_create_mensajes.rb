class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.references :user
      t.text :content
      t.boolean :seen

      t.timestamps
    end
    add_index :mensajes, :user_id
  end
end
