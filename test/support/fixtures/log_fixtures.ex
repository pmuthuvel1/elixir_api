defmodule ElixirApi.LogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirApi.Log` context.
  """

  @doc """
  Generate a events.
  """
  def events_fixture(attrs \\ %{}) do
    {:ok, events} =
      attrs
      |> Enum.into(%{
        event_type: "some event_type",
        message: "some message",
        payload: "some payload"
      })
      |> ElixirApi.Log.create_events()

    events
  end
end
