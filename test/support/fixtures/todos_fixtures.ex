defmodule TodosApp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodosApp.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        status: true
      })
      |> TodosApp.Todos.create_todo()

    todo
  end
end
