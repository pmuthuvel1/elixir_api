defmodule ElixirApi.StoreTest do
  use ElixirApi.DataCase

  alias ElixirApi.Store

  describe "products" do
    alias ElixirApi.Store.Product

    import ElixirApi.StoreFixtures

    @invalid_attrs %{brand: nil, color: nil, gender: nil, nickname: nil, offertype: nil, stylename: nil, stylestatus: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Store.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Store.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{brand: "some brand", color: "some color", gender: "some gender", nickname: "some nickname", offertype: "some offertype", stylename: "some stylename", stylestatus: "some stylestatus"}

      assert {:ok, %Product{} = product} = Store.create_product(valid_attrs)
      assert product.brand == "some brand"
      assert product.color == "some color"
      assert product.gender == "some gender"
      assert product.nickname == "some nickname"
      assert product.offertype == "some offertype"
      assert product.stylename == "some stylename"
      assert product.stylestatus == "some stylestatus"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{brand: "some updated brand", color: "some updated color", gender: "some updated gender", nickname: "some updated nickname", offertype: "some updated offertype", stylename: "some updated stylename", stylestatus: "some updated stylestatus"}

      assert {:ok, %Product{} = product} = Store.update_product(product, update_attrs)
      assert product.brand == "some updated brand"
      assert product.color == "some updated color"
      assert product.gender == "some updated gender"
      assert product.nickname == "some updated nickname"
      assert product.offertype == "some updated offertype"
      assert product.stylename == "some updated stylename"
      assert product.stylestatus == "some updated stylestatus"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_product(product, @invalid_attrs)
      assert product == Store.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Store.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Store.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Store.change_product(product)
    end
  end
end
