class UserController < ApplicationController
  before_action :authenticate_admin!
end