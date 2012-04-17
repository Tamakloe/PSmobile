class ChangeColumnNameForum < ActiveRecord::Migration
  def self.up
   rename_column :forums, :name, :title
  end

  def self.down
  end
end
