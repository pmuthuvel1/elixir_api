defmodule ElixirApiWeb.ProductControllerTest do
  use ElixirApiWeb.ConnCase

  import ElixirApi.StoreFixtures

  alias ElixirApi.Store.Product

  @create_attrs %{
    brand: "some brand",
    color: "some color",
    gender: "some gender",
    nickname: "some nickname",
    offertype: "some offertype",
    stylename: "some stylename",
    stylestatus: "some stylestatus"
  }
  @update_attrs %{
    brand: "some updated brand",
    color: "some updated color",
    gender: "some updated gender",
    nickname: "some updated nickname",
    offertype: "some updated offertype",
    stylename: "some updated stylename",
    stylestatus: "some updated stylestatus"
  }
  @invalid_attrs %{brand: nil, color: nil, gender: nil, nickname: nil, offertype: nil, stylename: nil, stylestatus: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some brand",
               "color" => "some color",
               "gender" => "some gender",
               "nickname" => "some nickname",
               "offertype" => "some offertype",
               "stylename" => "some stylename",
               "stylestatus" => "some stylestatus"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some updated brand",
               "color" => "some updated color",
               "gender" => "some updated gender",
               "nickname" => "some updated nickname",
               "offertype" => "some updated offertype",
               "stylename" => "some updated stylename",
               "stylestatus" => "some updated stylestatus"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end
end
