defmodule VidaSaudavel.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :"start_hour", :naive_datetime
      add :"end_hour", :naive_datetime

      timestamps()
    end
  end
end
