class AddBeforeDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :before_description, :text
  end
end
