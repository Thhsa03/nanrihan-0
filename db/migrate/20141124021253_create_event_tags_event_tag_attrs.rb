class CreateEventTagsEventTagAttrs < ActiveRecord::Migration
  def change
  	create_table :event_tags_event_tag_attrs do |t|
  		t.integer :event_tag_id
  		t.integer :event_tag_attr_id
  	end
  end
end
