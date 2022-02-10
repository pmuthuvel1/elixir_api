defmodule ElixirApi.StoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirApi.Store` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        color: "some color",
        gender: "some gender",
        nickname: "some nickname",
        offertype: "some offertype",
        stylename: "some stylename",
        stylestatus: "some stylestatus"
      })
      |> ElixirApi.Store.create_product()

    product
  end
end
