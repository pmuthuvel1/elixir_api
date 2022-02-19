defmodule ElixirApiWeb.Schema.ProductTypes do
  use Absinthe.Schema.Notation

  object :product do
    field :id, :id
    field :brand, :string
    field :color, :string
    field :gender, :string
    field :nickname, :string
    field :offertype, :string
    field :stylename, :string
    field :stylestatus, :string
  end

end
