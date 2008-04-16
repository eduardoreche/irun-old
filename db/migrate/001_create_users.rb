class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text :comment
      t.string :image

      t.timestamps
    end
    
    user = User.new
    user.name = "Administrador"
    user.email = "earlopes@coodetec.com.br"
    user.password = "1234567"
    user.comment = ""
    user.image = ""
    
    user.save
  end

  def self.down
    drop_table :users
  end
end
