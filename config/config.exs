use Mix.Config

config :sqs_poc, SqsPocQueue.Broker,
  adapter: ConduitSQS,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role]