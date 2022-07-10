class AddViewCounterToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :view_counter, :integer, default: 0
  end
end
