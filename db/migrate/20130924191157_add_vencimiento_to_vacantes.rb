class AddVencimientoToVacantes < ActiveRecord::Migration
  #Se agrega el Vencimiento y el plus a las vacantes y el precio unitario

  def change
   change_table :vacantes do |t|
      t.date :vencimiento, :default => Date.strptime("6/15/2012", '%m/%d/%Y')
      t.boolean :plus, :default => false
      t.float :price, :default => 179.00
      t.float :price_plus, :default => 229.00
    end
  end
end
