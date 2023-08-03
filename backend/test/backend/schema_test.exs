defmodule Backend.SchemaTest do
  use Backend.DataCase

  alias Backend.Schema

  describe "users" do
    alias Backend.Schema.User

    import Backend.SchemaFixtures

    @invalid_attrs %{bio: nil, email: nil, name: nil, number_of_pets: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Schema.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Schema.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{bio: "some bio", email: "some email", name: "some name", number_of_pets: 42}

      assert {:ok, %User{} = user} = Schema.create_user(valid_attrs)
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.number_of_pets == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{bio: "some updated bio", email: "some updated email", name: "some updated name", number_of_pets: 43}

      assert {:ok, %User{} = user} = Schema.update_user(user, update_attrs)
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.number_of_pets == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_user(user, @invalid_attrs)
      assert user == Schema.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Schema.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Schema.change_user(user)
    end
  end

  describe "links" do
    alias Backend.Schema.Link

    import Backend.SchemaFixtures

    @invalid_attrs %{description: nil, url: nil}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Schema.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Schema.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{description: "some description", url: "some url"}

      assert {:ok, %Link{} = link} = Schema.create_link(valid_attrs)
      assert link.description == "some description"
      assert link.url == "some url"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{description: "some updated description", url: "some updated url"}

      assert {:ok, %Link{} = link} = Schema.update_link(link, update_attrs)
      assert link.description == "some updated description"
      assert link.url == "some updated url"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_link(link, @invalid_attrs)
      assert link == Schema.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Schema.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Schema.change_link(link)
    end
  end
end
