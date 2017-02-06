class Account < ApplicationRecord
  def withdraw(amount)
    update(balance: balance - amount)
  end

  def deposit(amount)
    update(balance: balance + amount)
  end

  def transfer(recipient, amount)
    transaction do
      withdraw(amount)
      recipient.deposit(amount)

      raise ActiveRecord::Rollback
    end
  end
end
