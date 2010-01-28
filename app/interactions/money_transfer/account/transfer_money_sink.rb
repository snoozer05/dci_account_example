module TransferMoneySink
  def transfer_from(src, amount)
    src.withdraw(amount)
    deposit(amount)
  end
end
