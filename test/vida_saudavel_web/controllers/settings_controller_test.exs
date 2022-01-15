defmodule VidaSaudavelWeb.SettingsControllerTest do
  use VidaSaudavelWeb.ConnCase

  import VidaSaudavel.SettingsFixtures

  @create_attrs %{"end_hour": ~N[2022-01-07 22:02:00], "start_hour": ~N[2022-01-07 22:02:00]}
  @update_attrs %{"end_hour": ~N[2022-01-08 22:02:00], "start_hour": ~N[2022-01-08 22:02:00]}
  @invalid_attrs %{"end_hour": nil, "start_hour": nil}

  describe "index" do
    test "lists all settings", %{conn: conn} do
      conn = get(conn, Routes.settings_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Settings"
    end
  end

  describe "new settings" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.settings_path(conn, :new))
      assert html_response(conn, 200) =~ "New Settings"
    end
  end

  describe "create settings" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.settings_path(conn, :create), settings: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.settings_path(conn, :show, id)

      conn = get(conn, Routes.settings_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Settings"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.settings_path(conn, :create), settings: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Settings"
    end
  end

  describe "edit settings" do
    setup [:create_settings]

    test "renders form for editing chosen settings", %{conn: conn, settings: settings} do
      conn = get(conn, Routes.settings_path(conn, :edit, settings))
      assert html_response(conn, 200) =~ "Edit Settings"
    end
  end

  describe "update settings" do
    setup [:create_settings]

    test "redirects when data is valid", %{conn: conn, settings: settings} do
      conn = put(conn, Routes.settings_path(conn, :update, settings), settings: @update_attrs)
      assert redirected_to(conn) == Routes.settings_path(conn, :show, settings)

      conn = get(conn, Routes.settings_path(conn, :show, settings))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, settings: settings} do
      conn = put(conn, Routes.settings_path(conn, :update, settings), settings: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Settings"
    end
  end

  describe "delete settings" do
    setup [:create_settings]

    test "deletes chosen settings", %{conn: conn, settings: settings} do
      conn = delete(conn, Routes.settings_path(conn, :delete, settings))
      assert redirected_to(conn) == Routes.settings_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.settings_path(conn, :show, settings))
      end
    end
  end

  defp create_settings(_) do
    settings = settings_fixture()
    %{settings: settings}
  end
end
