class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.boolean     :locked
      t.string      :title, :uri, :author, :email
      t.text        :content
      t.string      :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
