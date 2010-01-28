require 'interactions/money_transfer/account/transfer_money_source'
require 'interactions/money_transfer/account/transfer_money_sink'

class MoneyTransfer
  def initialize(casts)
    self.cast(casts)
  end

  def cast(casts)
    @source = casts[:source_account].extend TransferMoneySource
    @sink = casts[:sink_account].extend TransferMoneySink
    @amount = casts[:amount] # should be play Funds as method-less roll??
  end

  def execute
    @source.transfer_to(@sink, @amount)
  end
end
