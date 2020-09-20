class CreateSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :socials do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :username
      t.string :email
      t.column :data, :json

      t.timestamps
    end
  end
end
