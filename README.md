# Fetcher Service
This is an Elixir application that fetches a web page, parses it, and extracts all the image and anchor tag URLs. The application utilizes the HTTPoison library for making HTTP requests and Floki for HTML parsing.

# Project Structure
The project consists of three main files:

- lib/fetcher_service/actions/extract_web_page_links.ex - Contains the main function that takes a URL and returns the extracted image and anchor tag URLs.
- lib/fetcher_service/http_client.ex - A behavior module defining the expected interface for an HTTP client.
- lib/fetcher_service/models/fetcher.ex - Contains the Fetcher struct, which holds the extracted image and anchor tag URLs.

# How to Run
- Install Elixir and its dependencies if you haven't already.
- Clone the repository.
- Navigate to the project directory and run mix deps.get to fetch the dependencies.
- Run the tests with `mix test`.
- Run the application with `iex -S mix` and then the following code to extract the image and anchor tag URLs from a web page:
```elixir
url = "https://uplearn.co.uk/"
FetcherService.Actions.ExtractWebPageLinks.call(url)
```

# Shortcomings
- Code Organization: The current project structure is simple, but as the project grows, it might be beneficial to further organize the code into separate contexts.
- Limited Extraction Scope: The current implementation only extracts URLs from <img> and <a> tags. It does not handle other tags that might contain URLs, such as <link>, <script>, or <iframe>. Expanding the extraction scope to include these additional tags would provide a more comprehensive list of assets and links on a web page.
- Error Handling: The current implementation does not handle all possible errors that may occur during the process, such as network errors, malformed HTML, or timeouts.
