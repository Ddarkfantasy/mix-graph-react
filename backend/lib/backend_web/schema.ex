defmodule BackendWeb.Schema do
  use Absinthe.Schema

  alias BackendWeb.SchemaResolver

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :bio, non_null(:string)
    field :number_of_pets, non_null(:integer)
  end


  query do
    @desc "Get all links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&SchemaResolver.all_links/3)
    end

    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&SchemaResolver.all_users/3)
    end
  end

end
