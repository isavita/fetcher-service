defmodule FetcherServiceWeb.Clients.HTTPClientBehaviour do
  @callback get_web_page(binary()) :: {:ok, map()} | {:error, map()}
end
