class ChangeTextCOlumnincomments < ActiveRecord::Migration[5.0]

  def change
    rename_column :comments, :comment_text, :text
  end

end
