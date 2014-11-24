class CreateEventTagAttrs < ActiveRecord::Migration
  def change
  	create_table :event_tag_attrs do |t|
  		t.string :name
  	end
  end
end
