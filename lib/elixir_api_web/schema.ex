defmodule ElixirApiWeb.Schema do
  use Absinthe.Schema

  import_types ElixirApiWeb.Schema.DataTypes
  import_types ElixirApiWeb.Schema.ProductTypes

  query do
    @desc "Get a list of events"
    field :events, list_of(:event) do
      resolve fn _parent, _args, _resolution ->
        {:ok, ElixirApi.Log.list_events()}
      end
    end

    @desc "Get a list of Products"
    field :products, list_of(:product) do
      resolve fn _parent, _args, _resolution ->
        {:ok, ElixirApi.Store.list_products()}
      end
    end

  end


end
