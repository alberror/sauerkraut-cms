class PostDatumService < ApplicationService
  attr_reader :post

  def initialize(post, ip, visitor)
    @post = post
    @ip = ip
    @visitor = visitor
  end

  def new
    increment
  end

  def increment
    PostDatum.create(post_id: @post.id, datum_type: "view") if !ENV["BLACKLIST_IPS"].include?(@ip) && !@visitor.admin?
  end
end
