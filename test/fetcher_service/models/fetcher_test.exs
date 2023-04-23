defmodule FetcherService.Models.FetcherTest do
  use ExUnit.Case

  alias FetcherService.Models.Fetcher

  describe "parse_html/1" do
    @web_page_body """
      <html>
        <body>
          <a href="https://www.google.com">Google</a>
          <img src="https://www.google.com/logo.png" />
          <a href="https://www.bing.com">Bing</a>
        </body>
      </html>
    """

    test "returns a Fetcher with list of links and assets" do
      assert {:ok,
              %Fetcher{
                assets: ["https://www.google.com/logo.png"],
                links: ["https://www.google.com", "https://www.bing.com"]
              }} = Fetcher.parse_html(@web_page_body)
    end

    test "removes empty links" do
      page_body = """
        <a href="https://www.google.com">Google</a>
        <a href="">Bing</a>
      """

      assert {:ok,
              %Fetcher{
                links: ["https://www.google.com"]
              }} = Fetcher.parse_html(page_body)
    end

    test "removes empty img src" do
      page_body = """
        <img src= />
        <img src="https://www.google.com/logo.png" />
      """

      assert {:ok,
              %Fetcher{
                assets: ["https://www.google.com/logo.png"]
              }} = Fetcher.parse_html(page_body)
    end
  end
end
