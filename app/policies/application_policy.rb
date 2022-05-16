# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  # `user` is added by default, but `account` terminology is used with rodauth
  # Read more about authorization context: https://actionpolicy.evilmartians.io/#/authorization_context
  authorization_targets.delete(:user)
  authorize :account, optional: true
end
