Mox.defmock(HTTPClientMock, for: FetcherServiceWeb.Clients.HTTPClientBehaviour)
Application.put_env(:fetcher_service, :http_client, HTTPClientMock)

ExUnit.start()
