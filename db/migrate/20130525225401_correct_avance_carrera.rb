class CorrectAvanceCarrera < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :avance_car, :string
    end
  end

end
