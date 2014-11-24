class CreateAppStatus < ActiveRecord::Migration
  def change
  	create_table :app_status do |t|
  		t.string :user_name
  	end
  end
end
