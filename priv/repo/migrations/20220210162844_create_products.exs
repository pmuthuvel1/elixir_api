defmodule ElixirApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :offertype, :string
      add :brand, :string
      add :stylename, :string
      add :nickname, :string
      add :color, :string
      add :gender, :string
      add :stylestatus, :string

      timestamps()
    end
  end
end
