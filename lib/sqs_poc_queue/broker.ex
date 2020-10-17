defmodule SqsPocQueue.Broker do
  use Conduit.Broker, otp_app: :sqs_poc

  configure do
    queue "sqs_poc"
  end

  pipeline :in_tracking do
    # plug Conduit.Plug.CorrelationId
    plug Conduit.Plug.LogIncoming
  end

  # pipeline :error_handling do
  #   plug Conduit.Plug.DeadLetter, broker: SqsPocQueue.Broker, publish_to: :error
  #   plug Conduit.Plug.Retry, attempts: 5
  # end

  # pipeline :deserialize do
  #   plug Conduit.Plug.Decode, content_encoding: "gzip"
  #   plug Conduit.Plug.Parse, content_type: "application/json"
  # end

  incoming SqsPocQueue do
    pipe_through :in_tracking

    subscribe :sqs_poc_received, SqsPocReceivedSubscriber, from: "sqs_poc"
  end

  # pipeline :out_tracking do
  #   plug Conduit.Plug.CorrelationId
  #   plug Conduit.Plug.CreatedBy, app: "sqs_poc"
  #   plug Conduit.Plug.CreatedAt
  #   plug Conduit.Plug.LogOutgoing
  # end

  # pipeline :serialize do
  #   plug Conduit.Plug.Format, content_type: "application/json"
  #   plug Conduit.Plug.Encode, content_encoding: "gzip"
  # end

  # pipeline :error_destination do
  #   plug :put_destination, &(&1.source <> "-error")
  # end

  outgoing do
    publish(:sqs_poc, to: "sqs_poc")
  end

  # outgoing do
  #   pipe_through [:error_destination, :out_tracking, :serialize]

  #   publish :error
  # end
end
