module TransferMoneySource
  def transfer_to(sink, amount)
    withdraw(amount)
    sink.deposit(amount)
  end
end
