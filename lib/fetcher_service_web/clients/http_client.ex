defmodule FetcherServiceWeb.Clients.HTTPClient do
  @behaviour FetcherServiceWeb.Clients.HTTPClientBehaviour

  @headers [{"Content-Type", "text/html"}]

  @impl true
  def get_web_page(url) do
    case HTTPoison.get(url, @headers, []) do
      {:ok, %{status_code: 200} = resp} ->
        {:ok, resp.body}

      {:ok, resp} ->
        {:error, resp}
    end
  end
end
