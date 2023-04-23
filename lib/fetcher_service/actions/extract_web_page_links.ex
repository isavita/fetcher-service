defmodule FetcherService.Actions.ExtractWebPageLinks do
  alias FetcherService.Models.Fetcher

  def call(url) do
    with :ok <- valide_url(url),
         {:ok, body} <- http_client().get_web_page(url),
         {:ok, %Fetcher{} = fetcher} <- Fetcher.parse_html(body) do
      {:ok, fetcher}
    end
  end

  defp valide_url(url) do
    case URI.parse(url) do
      %URI{scheme: "http", host: _host} -> :ok
      %URI{scheme: "https", host: _host} -> :ok
      _ -> {:error, :invalid_url}
    end
  end

  defp http_client do
    Application.fetch_env!(:fetcher_service, :http_client)
  end
end
