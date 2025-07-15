# Elixir

## General code quality
- We use `mix format` to ensure consistent formatting of our code. Run it frequently, and always before making a commit.
- We use `mix credo` for linting. Run it frequently, and do not ignore any style violations. You must ensure that the code passes all of the style checks before making a commit.

## Conventions
Project-specific conventions should always take precedence over general advice. That being said, if no obvious convention exists, you should follow these directions.

### General
- Try to keep things as vanilla as possible. Use the framework and libraries how they want to be used.
- The pipe operator (`|>`) is wonderful, use it frequently.
- When using the pipe operator to chain function calls, you should use it for everything within the chain; don't start with a normal function call, and then start piping. This is bad: `some_function(some_param) |> some_other_function()`. This is good: `some_param |> some_function() |> some_other_function()`.

### Contexts
- Name any function that returns a list of items `list_<plural_resource>`. For example, `list_users`.
- Name any function that returns a single item by ID `get_<singular_resource>/1`. For example, `get_user/1`.
- Name any function that returns a single item by any field other than the ID `get_<singular_resource>_by_<field>/1`. For example, `get_user_by_email/1`.
- Name any function that creates a new resource `create_<singular_resource>`. For example, `create_user`.
- Name any function that returns a changeset for creating a new resource `create_<singular_resource>_changeset`. For example, `create_user_changeset`.
- Name any function that updates an existing resource `update_<singular_resource>`. For example, `update_user`.
- Name any function that returns a changeset for updating an existing resource `update_<singular_resource>_changeset`. For example, `update_user_changeset`.

### Schemas
- Avoid using generic names for changeset functions (typically `changeset/2`). Instead, prefer names which describe the purpose. For example: `insert_changeset/2`, `update_changeset/2`, `update_email_changeset/2`.
- Name the first parameter of a changeset function `struct_or_changeset`. Name the second argument `attrs`.
- Prefer separate, composable validation functions. For example:

```elixir
# This is bad.
def insert_changeset(struct_or_changeset, attrs) do
    struct_or_changeset
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:email, min: 10, max: 255)
    |> validate_length(:name, min: 1, max: 255)
end
```

```elixir
# This is good.
def insert_changeset(struct_or_changeset, attrs) do
    struct_or_changeset
    |> cast(attrs, [:email, :name])
    |> validate_email_required()
    |> validate_name_required()
    |> validate_email()
    |> validate_name()
end
```

