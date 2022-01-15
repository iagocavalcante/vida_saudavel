defmodule VidaSaudavel.Settings.Settings do
  use Ecto.Schema
  import Ecto.Changeset

  schema "settings" do
    field :"end_hour", :naive_datetime
    field :"start_hour", :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(settings, attrs) do
    settings
    |> cast(attrs, [:"start_hour", :"end_hour"])
    |> validate_required([:"start_hour", :"end_hour"])
  end
end
