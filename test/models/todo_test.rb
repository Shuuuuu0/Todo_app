require "test_helper"

class TodoTest < ActiveSupport::TestCase
    #有効なタイトルでTodoを保存できるかを確認するテスト
    test "should save todo with valid title" do
      todo = Todo.new(title: "AIUEO", completed: false)
      assert todo.save, "Failed to save the todo with a valid title: #{todo.errors.full_messages.join(', ')}" #エラーメッセージを表示
    end    

    #タイトルが空の場合にTodoが保存されないかを確認するテスト
  test "should not save todo without a title" do
    todo = Todo.new(title: "")
    assert_not todo.save, "Saved the todo without a title"
  end

    #無効な completed 値を持つTodoが保存されないかを確認するテスト
  test "should not save todo with invalid completed value" do
    todo = Todo.new(title: "AIUEO", completed: nil)
    assert_not todo.save, "Saved the todo with a nil completed value"
  end
end
