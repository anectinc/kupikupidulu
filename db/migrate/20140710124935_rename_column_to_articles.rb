class RenameColumnToArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :description, :after_description
  end
end
