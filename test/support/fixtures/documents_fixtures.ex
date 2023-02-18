defmodule Editus.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Editus.Documents` context.
  """

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        content: "some content",
        name: "some name"
      })
      |> Editus.Documents.create_document()

    document
  end
end
