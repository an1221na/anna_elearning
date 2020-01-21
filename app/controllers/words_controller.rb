class WordsController < ApplicationController
  def index
    @lessons = current_user.lessons
    @answers = current_user.answers.paginate(page: params[:page], per_page: 10)
  end
end
