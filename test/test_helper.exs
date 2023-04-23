Mox.defmock(HTTPClientMock, for: FetcherServiceWeb.Clients.HTTPClientBehaviour)
Application.put_env(:gateway, :http_client, HTTPClientMock)

ExUnit.start()
