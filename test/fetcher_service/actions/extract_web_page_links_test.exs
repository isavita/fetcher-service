defmodule FetcheFetcherService.Actions.ExtractWebPageLinksrTest do
  use ExUnit.Case

  alias FetcherService.Actions.ExtractWebPageLinks
  alias FetcherService.Models.Fetcher

  import Mox
  setup :verify_on_exit!

  describe "ExtractWebPageLinks.call/1" do
    test "returns {:ok, fetcher} for a valid URL and successful extraction" do
      url = "https://example.com"

      body = """
      <html>
        <body>
          <img src="image1.jpg" />
          <a href="https://example.com/link1">Link1</a>
        </body>
      </html>
      """

      expect(HTTPClientMock, :get_web_page, fn ^url -> {:ok, body} end)

      expected_fetcher = %Fetcher{assets: ["image1.jpg"], links: ["https://example.com/link1"]}

      assert {:ok, ^expected_fetcher} = ExtractWebPageLinks.call(url)
    end

    test "returns {:error, :invalid_url} for an invalid URL" do
      url = "invalid_url"
      assert {:error, :invalid_url} = ExtractWebPageLinks.call(url)
    end

    test "returns an error tuple when HTTP client fails" do
      url = "https://example.com"
      error = {:error, :failed_request}

      expect(HTTPClientMock, :get_web_page, fn ^url -> error end)

      assert ^error = ExtractWebPageLinks.call(url)
    end
  end
end
