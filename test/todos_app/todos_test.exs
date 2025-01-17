defmodule TodosApp.TodosTest do
  use TodosApp.DataCase

  alias TodosApp.Todos

  describe "todos" do
    alias TodosApp.Todos.Todo

    import TodosApp.TodosFixtures

    @invalid_attrs %{name: nil, status: nil, description: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Todos.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todos.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{name: "some name", status: true, description: "some description"}

      assert {:ok, %Todo{} = todo} = Todos.create_todo(valid_attrs)
      assert todo.name == "some name"
      assert todo.status == true
      assert todo.description == "some description"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{name: "some updated name", status: false, description: "some updated description"}

      assert {:ok, %Todo{} = todo} = Todos.update_todo(todo, update_attrs)
      assert todo.name == "some updated name"
      assert todo.status == false
      assert todo.description == "some updated description"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo(todo, @invalid_attrs)
      assert todo == Todos.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Todos.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo(todo)
    end
  end
end
