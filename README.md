# Togglex

Simple Elixir wrapper for the [Toggl API](https://github.com/toggl/toggl_api_docs).

Based heavily on the [ExTracker](https://github.com/dashofcode/extracker),
[Tentacat](https://github.com/edgurgel/tentacat) and
[ExTwiter](https://github.com/parroty/extwitter) libraries.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add togglex to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:togglex, "~> 0.0.1"}]
  end
  ```

2. Ensure togglex is started before your application:

  ```elixir
  def application do
    [applications: [:togglex]]
  end
  ```

## Usage

All calls to Toggl APIs must use a Client which contains the access token and
the endpoint. The API is splitted in two different parts. The first one is
called **Toggl API** which is essentially a RESTful API that you can use to
create, update, delete and get most of the resources from Toggl service. On the
other hand there is a read-only **Reports API** which you can use to obtain
aggregated data based on more or less complex queries.

### Toggl API examples

Initializing the client for the Toggl API endpoint:

```elixir
client = Togglex.Client.new(%{access_token: "YOU_ACCESS_TOKEN"}, :api)
```

Get workspace projects:

```elixir
Togglex.Api.Workspaces.projects(client, "YOUR_WORKSPACE_ID")
```

### Reports API examples

Initializing the client for the Reports API endpoint:

```elixir
client = Togglex.Client.new(%{access_token: "YOU_ACCESS_TOKEN"}, :reports)
```

Getting a detailed report based on some parameters:

```elixir
Togglex.Reports.detailed(client, %{workspace_id: "YOUR_WORKSPACE_ID", project_ids: "COMMA_SEPARATED_PROJECT_IDS"})
```

Getting a summarized report based on some parameters:

```elixir
Togglex.Reports.summary(client, %{workspace_id: "YOUR_WORKSPACE_ID", project_ids: "COMMA_SEPARATED_PROJECT_IDS"})
```

Check out in the next section which API calls are already implemented in this
wrapper.

## Features

### Toggl API

* Authenticate and get user data
  * [ ] HTTP Basic Auth with e-mail and password
  * [ ] HTTP Basic Auth with API token
  * [ ] Authentication with a session cookie
  * [ ] Destroy the session

* Clients
  * [x] create a client
  * [x] get client details
  * [x] update a client
  * [x] delete a client
  * [x] get clients visible to user
  * [x] get client projects

* Projects
  * [x] create a project
  * [x] get project data
  * [x] update project data
  * [x] delete a project
  * [x] get project users
  * [x] get project tasks
  * [ ] delete multiple projects

* Project users
  * [ ] create a project user
  * [ ] update a project user
  * [ ] delete a project user
  * [ ] add multiple users to a project
  * [ ] update multiple project users
  * [ ] delete multiple project users

* Tags
  * [x] create a tag
  * [x] update a tag
  * [x] delete a tag

* Tasks (available only for pro workspaces)
  * [x] create a task
  * [x] get task details
  * [x] update a task
  * [x] delete a task
  * [ ] update multiple tasks
  * [ ] delete multiple tasks

* Time entries
  * [x] create a time entry
  * [x] start a time entry
  * [x] stop a time entry
  * [x] get time entry details
  * [x] get running time entry
  * [x] update time entry
  * [x] delete time entry
  * [x] get time entries started in a specific time range
  * [ ] bulk update time entries tags

* Users
  * [ ] get current user data and time entries
  * [ ] update current user data
  * [ ] reset API token
  * [ ] sign up new user

* Workspaces
  * [x] get user workspaces
  * [x] get single workspace
  * [x] get workspace users
  * [x] get workspace clients
  * [x] get workspace projects
  * [x] get workspace tasks
  * [x] get workspace tags
  * [x] update workspace

* Workspace users
  * [ ] invite users to workspace
  * [ ] update workspace user
  * [ ] delete workspace user
  * [ ] get workspace users for a workspace

* Dashboard
  * [ ] get a generic overview of your team

### Reports API

* [x] Weekly report
* [x] Detailed report
* [x] Summary report
* [x] Project dashboard
