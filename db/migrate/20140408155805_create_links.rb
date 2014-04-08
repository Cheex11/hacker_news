class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.column :url, :string
      t.column :title, :string
      t.column :score, :int

      t.timestamps
    end
  end
end
