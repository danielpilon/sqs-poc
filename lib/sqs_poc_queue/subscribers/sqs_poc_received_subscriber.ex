defmodule SqsPocQueue.SqsPocReceivedSubscriber do
  use Conduit.Subscriber

  def process(message, _opts) do
    # Code to process the message

    message |> IO.inspect
  end
end
