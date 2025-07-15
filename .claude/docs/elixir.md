# Elixir

- We use `mix format` to ensure consistent formatting of our code. Run it frequently, and always before making a commit.
- We use `mix credo` for linting. Run it frequently, and do not ignore any style violations. You must ensure that the code passes all of the style checks before making a commit.
- We use the Phoenix framework with LiveView, and try to keep things as vanilla as possible. Use the framework how it wants to be used.
- The pipe operator (`|>`) is wonderful, and we use it frequently. If you're using the pipe operator to chain some function calls, you should use it for everything within the chain; don't start with a normal function call, and then start piping. This is bad: `some_function(some_param) |> some_other_function()`. This is good: `some_param |> some_function() |> some_other_function()`.
