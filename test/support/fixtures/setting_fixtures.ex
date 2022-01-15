defmodule VidaSaudavel.SettingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VidaSaudavel.Settings` context.
  """

  @doc """
  Generate a settings.
  """
  def settings_fixture(attrs \\ %{}) do
    {:ok, settings} =
      attrs
      |> Enum.into(%{
        end_hour: ~N[2022-01-07 22:02:00],
        start_hour: ~N[2022-01-07 22:02:00]
      })
      |> VidaSaudavel.Settings.create_settings()

    settings
  end
end
