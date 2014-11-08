class CreateUsersTags < ActiveRecord::Migration
  def change
  	create_table :users_tags do |t|
  		t.integer :user_id
  		t.string :name
  	end
  end
end
