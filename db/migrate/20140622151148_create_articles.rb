class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :category, null: false, index: true
      t.string :title, null: false
      t.text :description
      t.string :source_name
      t.string :source_url
      t.string :poster_name
      t.boolean :displayable, null: false, default: false
      t.with_options null: false, default: 0 do |t|
        t.integer :tweeted_count
        t.integer :shared_count
        t.integer :score
      end
      t.datetime :deleted_at, default: nil

      t.timestamps
    end
  end
end
