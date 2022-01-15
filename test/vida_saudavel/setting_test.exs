defmodule VidaSaudavel.SettingsTest do
  use VidaSaudavel.DataCase

  alias VidaSaudavel.Settings

  describe "settings" do
    alias VidaSaudavel.Settings.Settings

    import VidaSaudavel.SettingsFixtures

    @invalid_attrs %{"end_hour": nil, "start_hour": nil}

    test "list_settings/0 returns all settings" do
      settings = settings_fixture()
      assert Setting.list_settings() == [settings]
    end

    test "get_settings!/1 returns the settings with given id" do
      settings = settings_fixture()
      assert Setting.get_settings!(settings.id) == settings
    end

    test "create_settings/1 with valid data creates a settings" do
      valid_attrs = %{"end_hour": ~N[2022-01-07 22:02:00], "start_hour": ~N[2022-01-07 22:02:00]}

      assert {:ok, %Settings{} = settings} = Setting.create_settings(valid_attrs)
      assert settings.end_hour == ~N[2022-01-07 22:02:00]
      assert settings.start_hour == ~N[2022-01-07 22:02:00]
    end

    test "create_settings/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_settings(@invalid_attrs)
    end

    test "update_settings/2 with valid data updates the settings" do
      settings = settings_fixture()
      update_attrs = %{"end_hour": ~N[2022-01-08 22:02:00], "start_hour": ~N[2022-01-08 22:02:00]}

      assert {:ok, %Settings{} = settings} = Setting.update_settings(settings, update_attrs)
      assert settings.end_hour == ~N[2022-01-08 22:02:00]
      assert settings.start_hour == ~N[2022-01-08 22:02:00]
    end

    test "update_settings/2 with invalid data returns error changeset" do
      settings = settings_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_settings(settings, @invalid_attrs)
      assert settings == Setting.get_settings!(settings.id)
    end

    test "delete_settings/1 deletes the settings" do
      settings = settings_fixture()
      assert {:ok, %Settings{}} = Setting.delete_settings(settings)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_settings!(settings.id) end
    end

    test "change_settings/1 returns a settings changeset" do
      settings = settings_fixture()
      assert %Ecto.Changeset{} = Setting.change_settings(settings)
    end
  end
end
