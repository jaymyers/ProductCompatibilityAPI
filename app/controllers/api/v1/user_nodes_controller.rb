class Api::V1::UserNodesController < ApplicationController
  respond_to :json

  def index
    respond_with UserNodes.all
  end

  def show
    respond_with UserNodes.find(params[:id])
  end

  def create
    user_node = UserNodes.new(user_node_params)
    if user_node.save
      render json: user_node, status: 201, location: [:api, user_node]
    else
      render json: { errors: user_node.errors }, status: 422
    end
  end

  def update
    user_node = UserNodes.find(params[:id])
    if user_node.update(user_node_params)
      render json: user_node, status: 200, location: [:api, user_node]
    else
      render json: { errors: user_node.errors }, status: 422
    end
  end

  def destroy
    user_node = UserNodes.find(params[:id])
    user_node.destroy
    head 204
  end

  private

    def user_node_params
      params.require(:user_nodes).permit(:email, :password, :password_confirmation, :employee_number, :employee_score)
    end

end
