require 'data/teller_machine'
require 'interactions/money_transfer/teller_machine/atm'
require 'contexts/money_transfer'

前提 /^口座番号"([^\"]*)"の残高が"([^\"]*)"円である$/ do |account_id, balance|
  @atm ||= TellerMachine.new.extend ATM
  @atm.find_account(account_id).balance = balance.to_i
end

もし /^以下の内容で資金移動を行う$/ do |table|
  source_account_id = table.hashes[0]["支払い元口座番号"]
  sink_account_id = table.hashes[0]["支払い先口座番号"]
  amount = table.hashes[0]["資金移動金額"].to_i

  MoneyTransfer.new(
    :source_account => @atm.find_account(source_account_id),
    :sink_account => @atm.find_account(sink_account_id),
    :amount => amount
  ).execute
end

ならば /^口座番号"([^\"]*)"の残高が"([^\"]*)"円であること$/ do |account_id, balance|
  @atm.find_account(account_id).balance.should == balance.to_i
end
