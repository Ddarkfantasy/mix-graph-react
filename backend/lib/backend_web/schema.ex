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
    field :email, non_null(:string)
    field :firstname, non_null(:string)
    field :lastname, non_null(:string)
    field :username, non_null(:string)
    field :age, non_null(:integer)
    field :projects, (list_of(non_null(:project))) do
      resolve(&SchemaResolver.user_projects/3)
    end
  end

  object :project do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :users, (list_of(non_null(:user))) do
      resolve(&SchemaResolver.project_users/3)
    end
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
