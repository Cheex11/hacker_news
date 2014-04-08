class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.column :description, :text
        t.column :link_id, :int
        t.timestamps
    end
  end
end
