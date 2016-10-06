# Slack Integrations in Elixir/Phoenix
## Or bots, slash commands, and webhooks—ohmy.

In my efforts to learn about Elixir/Phoenix, I thought it would be fun to play with Slack integrations. This article is based on a lightning talk I gave recently at our local ruby group. We'll go through building a slackbot in Elixir, set up a slash command, and a webhook.

# Type of integrations
## Bots
### Setup project
#### New: mix new rubybot --sup
#### Add deps, token, and application

### Handling messages
#### GenServer implementation
#### start_link pass token
#### handle_message(), generic handle_message, looking for words or @bot

## Slash commands
### New Phoenix Project 
### Setup slash command in Slack admin -- Ngrok FTW
### Route to post to /api/commands
### CURL it ngrok.com/api/commands  

### %{response_type: response_type, text: reply}
#### in_channel vs ephemeral


## Webhooks
### Incoming - something happens in slack -> goes to your server
### Outgoing - something happens in your server -> goes to slack
### Setup webhook in slack
### POST to it

### Side-note performance:

```
[info] POST /webhooks/pings
[debug] Processing by OkcrbServer.Webhook.PingController.create/2
  Parameters: %{}
  Pipelines: [:api]
[info] Sent 200 in 274ms

Compiled web/controllers/webhook/ping_controller.ex
[info] POST /webhooks/pings
[debug] Processing by OkcrbServer.Webhook.PingController.create/2
  Parameters: %{}
  Pipelines: [:api]
[info] Sent 200 in 114µs

                     ^ What
```