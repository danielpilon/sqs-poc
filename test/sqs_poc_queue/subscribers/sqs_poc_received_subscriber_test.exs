defmodule SqsPocQueue.SqsPocReceivedSubscriberTest do
  use ExUnit.Case
  use Conduit.Test
  import Conduit.Message
  alias Conduit.Message
  alias SqsPocQueue.SqsPocReceivedSubscriber

  describe "process/2" do
    test "returns acked message" do
      message =
        %Message{}
        |> put_body("foo")

      assert %Message{status: :ack} = SqsPocReceivedSubscriber.run(message)
    end
  end
end
