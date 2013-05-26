class AddStatusAndTimetoVacantes < ActiveRecord::Migration
  def change
    change_table :vacantes do |t|
      t.string :status
      t.date   :inicia
      t.date   :termina
    end
  end
end
