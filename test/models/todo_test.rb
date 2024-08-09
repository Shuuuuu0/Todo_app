require "test_helper"

class TodoTest < ActiveSupport::TestCase
  # バリデーションのテスト
  test "should not save todo without title" do
    todo = Todo.new
    assert_not todo.save, "Saved the todo without a title"
  end

  test "should save todo with valid title" do
    todo = Todo.new(title: "Sample Todo")
    unless todo.save
      puts todo.errors.full_messages # エラーメッセージを表示
    end
    assert todo.save, "Failed to save the todo with a valid title"
  end

  test "completed should be boolean" do
    todo = Todo.new(title: "Sample Todo", completed: true)
    unless todo.save
      puts todo.errors.full_messages # エラーメッセージを表示
    end
    assert_not todo.save, "Saved the todo with a non-boolean completed value"
  end
end
