defmodule FetcherService.Actions.ExtractWebPageLinks do
  alias FetcherService.Models.Fetcher

  def call(url) do
    with {:ok, _uri} <- URI.new(url),
         {:ok, body} <- http_client().get_web_page(url),
         %Fetcher{} = fetcher <- Fetcher.parse_html(body) do
      {:ok, fetcher}
    end
  end

  defp http_client do
    Application.fetch_env!(:fetcher_service, :http_client)
  end
end
