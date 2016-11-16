defmodule Meower.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :author, :string, null: false
      add :content, :string, null: false

      timestamps
    end
  end
end
