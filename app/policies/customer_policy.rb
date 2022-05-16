# See https://actionpolicy.evilmartians.io/#/writing_policies
class CustomerPolicy < ApplicationPolicy

  def show?
    account.role == 'customer'
  end

  def update?    
    account.role == 'customer'
  end
  
end
