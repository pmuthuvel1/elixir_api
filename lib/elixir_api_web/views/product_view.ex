defmodule ElixirApiWeb.ProductView do
  use ElixirApiWeb, :view
  alias ElixirApiWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      offertype: product.offertype,
      brand: product.brand,
      stylename: product.stylename,
      nickname: product.nickname,
      color: product.color,
      gender: product.gender,
      stylestatus: product.stylestatus
    }
  end
end
