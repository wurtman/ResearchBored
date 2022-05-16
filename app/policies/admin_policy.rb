# See https://actionpolicy.evilmartians.io/#/writing_policies
class AdminPolicy < ApplicationPolicy

  def index?
    account.role == 'admin'
  end

  def show?
    account.role == 'admin'
  end

  def edit?    
    account.role == 'admin'
  end

  def update?    
    account.role == 'admin'
  end

  def new?
    account.role == 'admin'
  end

  def create?
    account.role == 'admin'
  end

  def destroy?
    account.role == 'admin'
  end
  
end
