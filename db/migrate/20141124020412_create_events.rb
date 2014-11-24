class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.integer :user_id  # 登録ユーザー番号
  		t.string :name
  		t.date :start_date
  		t.date :end_date
  		t.string :location
  		t.float :latitude
    	t.float :longitude
  		t.string :comment
    	t.datetime :registration_date
  		t.timestamps
  	end
  end
end
