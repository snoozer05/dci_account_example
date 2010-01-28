require 'data/account'

module ATM
  def find_account(id)
    @accounts ||= {}
    setup_account(id) unless @accounts.member?(id)
    return @accounts[id]
  end

  def setup_account(id)
    @accounts ||= {}
    @accounts[id] = Account.new
  end
end
