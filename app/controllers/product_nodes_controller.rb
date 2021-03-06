class ProductNodesController < ApplicationController
  respond_to :json
  # These methods take care of handling the creation, showing, updating and deletion
  # of the product nodes in Neo4j.
  def index
    respond_with ProductNodes.all
  end

  def show
    respond_with ProductNodes.find(params[:id])
  end

  def create
    product_node = ProductNodes.new(product_node_params)
    if product_node.save
      render json: product_node, status: 201
    else
      render json: { errors: product_node.errors }, status: 422
    end
  end

  def update
    product_node = ProductNodes.find(params[:id])
    if product_node.update(product_node_params)
      render json: product_node, status: 200
    else
      render json: { errors: product_node.errors }, status: 422
    end
  end

  def destroy
    product_node = ProductNodes.find(params[:id])
    product_node.destroy
    head 204
  end

  private

    def product_node_params
      params.require(:product_nodes).permit(:title, :maker, :sku, :price)
    end
end
