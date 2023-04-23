defmodule FetcherService.Models.Fetcher do
  defstruct assets: [], links: []

  def parse_html(body) do
    with {:ok, doc} <- Floki.parse_document(body),
         assets <- find_assets(doc),
         links <- find_links(doc) do
      {:ok, %__MODULE__{assets: assets, links: links}}
    end
  end

  defp find_assets(doc) do
    Floki.find(doc, "img[src]") |> Floki.attribute("src") |> Enum.reject(&(&1 == "" || &1 == nil))
  end

  defp find_links(doc) do
    Floki.find(doc, "a[href]") |> Floki.attribute("href") |> Enum.reject(&(&1 == "" || &1 == nil))
  end
end
