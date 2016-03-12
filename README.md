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

## Features

### Toggl API

* Authenticate and get user data
  * [ ] HTTP Basic Auth with e-mail and password
  * [ ] HTTP Basic Auth with API token
  * [ ] Authentication with a session cookie
  * [ ] Destroy the session

* Clients
  * [ ] create a client
  * [ ] get client details
  * [ ] update a client
  * [ ] get clients visible to user
  * [ ] get client projects

* Projects
  * [ ] create a project
  * [x] get project data
  * [ ] update project data
  * [ ] delete a project
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
  * [ ] create a tag
  * [ ] update a tag
  * [ ] delete a tag

* Tasks (available only for pro workspaces)
  * [ ] create a task
  * [ ] get task details
  * [ ] update a task
  * [ ] delete a task
  * [ ] update multiple tasks
  * [ ] delete multiple tasks

* Time entries
  * [ ] create a time entry
  * [ ] start a time entry
  * [ ] stop a time entry
  * [ ] get time entry details
  * [ ] update time entry
  * [ ] delete time entry
  * [ ] get time entries started in a specific time range
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
  * [ ] update workspace

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
