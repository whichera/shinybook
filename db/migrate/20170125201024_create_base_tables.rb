class CreateBaseTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end
    
    create_table :boxes do |t|
      t.references :user
      t.string :name
      t.timestamps
    end
    
    create_table :pokemon do |t|
      t.references :user
      t.references :box
      t.string :name
      t.string :nickname
      t.text :description
      t.timestamps
    end
  end
end
