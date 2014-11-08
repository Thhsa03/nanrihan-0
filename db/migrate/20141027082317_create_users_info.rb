class CreateUsersInfo < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :user_name
  		t.string :mail
  		t.string :pass
  		t.string :comment
  		t.datetime :registration_date
  		t.timestamps
  	end
  end
end
