---
name: elixir-programmer
description: Provides specialist knowledge when programming in Elixir. Use whenever you need to write Elixir code.
---

## Overview
This skill provides specialist guidance for working with Elixir code. It builds upon the general coding standards and practises encoded in the agent prompts.

## General guidelines
- Write idiomatic Elixir: use pattern matching, pipe operators, guard clauses, and with-expressions where appropriate.
- Favour small, focused functions with clear names.
- Document all non-test modules and public functions.
- NEVER add external dependencies to the project without explicit approval from the user.
- NEVER use `String.to_atom/1` on user input
- NEVER nest multiple modules in the same file
- NEVER use map access syntax (`changeset[:field]`) on structs; use dot notation or appropriate API functions like `Ecto.Changeset.get_field/2`.
- Predicate functions end with `?`; the `is_` prefix is reserved for guards.
- Lists do not support index-based access via `[]`. Use `Enum.at/2`, pattern matching, or `List` functions
- Use the available code quality tools early and often:
    - `mix compile --warnings-as-errors`
    - `mix format --check-formatted`
    - `mix test`
    - `mix credo`


## Ecto guidelines
- ALWAYS use `mix ecto.gen.migration migration_name` to generate migration files.
- Remember to use `import Ecto.Query` when writing queries.

## Phoenix & LiveView guidelines
- NEVER use deprecated `live_redirect`/`live_patch`; use `<.link navigate={...}>` and `<.link patch={...}>`.
- ALWAYS use LiveView streams for collections to avoid memory issues.
- ALWAYS use `to_form/2` and `<.form for={@form}>`; never pass changesets directly to templates.
- ALWAYS add unique DOM IDs to key elements.
- NEVER use `<% Enum.each %>` in templates; use `<%= for item <- @collection do %>`.
- NEVER write inline `<script>` tags, use colocated hooks or external hook files.
- Colocated JS hook names must start with `.` prefix.
- Streams are not enumerable; to filter or refresh, refetch data and re-stream with `reset: true`.
- Use the `<.input>` component from `core_components.ex` for form inputs.
- Use `{...}` for interpolation in tag attributes; `<%= %>` for block constructs in tag bodies

## Testing guidelines
- Test outcomes, not implementation details.
- When debugging test failures, use `LazyHTML.filter/2` to inspect specific selectors.
- Split test cases into small, focused files.
- NEVER use `mix ecto.reset` to reset the test database, as this will populate it with seed data. ALWAYS use `MIX_ENV=test mix ecto.drop`.
- ALWAYS use `start_supervised!/1` to start processes in tests.
- NEVER use `Process.sleep/1` — use `Process.monitor/1` and `assert_receive {:DOWN, ...}` or `:sys.get_state/1` for synchronisation.
- NEVER test against raw HTML — use `element/2`, `has_element/2`, and similar functions.

## Mix commands
- Read docs before using unfamiliar mix tasks (`mix help task_name`)
- Debug test failures with `mix test test/my_test.exs` or `mix test --failed`
- Avoid `mix deps.clean --all` unless there's a specific reason
- Use `mix precommit` when done with all changes

