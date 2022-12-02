class UsersController < ApplicationController
  before_action :set_user
  before_action :set_followee, only: [:follow]
  before_action :validate_way, only: [:clock_in]
  rescue_from "ActiveRecord::RecordNotFound" do |e|
    render json: {error: e.message}, status: 404
  end

  def clock_in
    @user.clock_ins.create(way: params[:way])
    @clock_ins = ClockIn.where(user_id: @user.id)
    render "/users/clock_ins/index", status: :created
  end

  def follow
    FollowRecord.create(follower: @user, followee: @followee)
    render json: {}, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_followee
    @followee = User.find(params[:followee_id])
  end

  def validate_way
    return if %w[wake_up sleep].include? params[:way]
    render json: {error: "Invalid type."}, status: :bad_request
  end
end
