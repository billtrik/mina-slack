# Required
set :slack_api_base_url,        -> { ENV['SLACK_URL'] || 'https://slack.com/api/chat.postMessage' }
set :slack_token,               -> { ENV['SLACK_TOKEN'] }
set :slack_channel,             -> { ENV['SLACK_CHANNEL'] }
# Optional
set_default :slack_stage,       -> { ENV['SLACK_STAGE'] || ENV['to'] || fetch(:rails_env, 'production') }
set_default :slack_application, -> { ENV['SLACK_APPLICATION'] || application }
set_default :slack_username,    -> { ENV['SLACK_USERNAME'] || 'deploybot' }
set_default :slack_emoji,       -> { ENV['SLACK_EMOJI'] || ':cloud:' }
# Git
set_default :deployer,          -> { ENV['GIT_AUTHOR_NAME'] || %x[git config user.name].chomp }
set_default :deployed_revision, -> { ENV['GIT_COMMIT'] || %x[git rev-parse #{branch}].strip }
