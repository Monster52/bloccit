class AddNullFullToTopicOnPosts < ActiveRecord::Migration
  def change
    change_column_null :posts, :topic_id, false
  end
end
