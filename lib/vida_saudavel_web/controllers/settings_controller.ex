defmodule VidaSaudavelWeb.SettingsController do
  use VidaSaudavelWeb, :controller

  alias VidaSaudavel.Settings, as: Config
  alias VidaSaudavel.Settings.Settings

  def index(conn, _params) do
    settings = Config.list_settings()
    render(conn, "index.html", settings: settings)
  end

  def new(conn, _params) do
    changeset = Config.change_settings(%Settings{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"settings" => settings_params}) do
    case Config.create_settings(settings_params) do
      {:ok, settings} ->
        conn
        |> put_flash(:info, "Settings created successfully.")
        |> redirect(to: Routes.settings_path(conn, :show, settings))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    settings = Config.get_settings!(id)
    render(conn, "show.html", settings: settings)
  end

  def edit(conn, %{"id" => id}) do
    settings = Config.get_settings!(id)
    changeset = Config.change_settings(settings)
    render(conn, "edit.html", settings: settings, changeset: changeset)
  end

  def update(conn, %{"id" => id, "settings" => settings_params}) do
    settings = Config.get_settings!(id)

    case Config.update_settings(settings, settings_params) do
      {:ok, settings} ->
        conn
        |> put_flash(:info, "Settings updated successfully.")
        |> redirect(to: Routes.settings_path(conn, :show, settings))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", settings: settings, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    settings = Config.get_settings!(id)
    {:ok, _settings} = Config.delete_settings(settings)

    conn
    |> put_flash(:info, "Settings deleted successfully.")
    |> redirect(to: Routes.settings_path(conn, :index))
  end
end
