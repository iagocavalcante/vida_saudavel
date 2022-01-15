defmodule VidaSaudavel.Settings do
  @moduledoc """
  The Setting context.
  """

  import Ecto.Query, warn: false
  alias VidaSaudavel.Repo

  alias VidaSaudavel.Settings.Settings

  @doc """
  Returns the list of settings.

  ## Examples

      iex> list_settings()
      [%Settings{}, ...]

  """
  def list_settings do
    Repo.one(Settings) |> IO.inspect()
  end

  @doc """
  Gets a single settings.

  Raises `Ecto.NoResultsError` if the Settings does not exist.

  ## Examples

      iex> get_settings!(123)
      %Settings{}

      iex> get_settings!(456)
      ** (Ecto.NoResultsError)

  """
  def get_settings!(id), do: Repo.get!(Settings, id)

  @doc """
  Creates a settings.

  ## Examples

      iex> create_settings(%{field: value})
      {:ok, %Settings{}}

      iex> create_settings(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_settings(attrs \\ %{}) do
    %Settings{}
    |> Settings.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a settings.

  ## Examples

      iex> update_settings(settings, %{field: new_value})
      {:ok, %Settings{}}

      iex> update_settings(settings, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_settings(%Settings{} = settings, attrs) do
    settings
    |> Settings.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a settings.

  ## Examples

      iex> delete_settings(settings)
      {:ok, %Settings{}}

      iex> delete_settings(settings)
      {:error, %Ecto.Changeset{}}

  """
  def delete_settings(%Settings{} = settings) do
    Repo.delete(settings)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking settings changes.

  ## Examples

      iex> change_settings(settings)
      %Ecto.Changeset{data: %Settings{}}

  """
  def change_settings(%Settings{} = settings, attrs \\ %{}) do
    Settings.changeset(settings, attrs)
  end
end
