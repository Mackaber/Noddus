class AddOmniauthtousers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :uid
      t.string :provider
    end
  end

  def down
  end
end
