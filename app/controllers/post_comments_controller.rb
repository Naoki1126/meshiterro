class PostCommentsController < ApplicationController
	def create
		post_image = PostImage.find(params[:post_image_id])
		comment = current_user.postcomments.new(post_comment_params)
		comment.post_image_id = post_image.id
		comment.save
		redirect_to post_image_path(post_image)
	end
	private
	def post_comment_params
		params.require(:postcomment).permit(:comment)
	end
