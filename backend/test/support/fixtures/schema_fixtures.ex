defmodule Backend.SchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Schema` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        email: "some email",
        name: "some name",
        number_of_pets: 42
      })
      |> Backend.Schema.create_user()

    user
  end

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        description: "some description",
        url: "some url"
      })
      |> Backend.Schema.create_link()

    link
  end
end
