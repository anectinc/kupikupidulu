class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.references :article, index: true
      t.string :file
      t.string :file_tmp
      t.string :video_code
      t.string :type

      t.timestamps
    end
  end
end
