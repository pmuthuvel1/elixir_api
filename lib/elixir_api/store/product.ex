defmodule ElixirApi.Store.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :brand, :string
    field :color, :string
    field :gender, :string
    field :nickname, :string
    field :offertype, :string
    field :stylename, :string
    field :stylestatus, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:offertype, :brand, :stylename, :nickname, :color, :gender, :stylestatus])
    |> validate_required([:offertype, :brand, :stylename, :nickname, :color, :gender, :stylestatus])
  end
end
