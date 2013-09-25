class ChangeTypeToTipo < ActiveRecord::Migration
  def change
    change_table :relationships do |t|
      t.rename :type, :tipo
    end
  end
end
