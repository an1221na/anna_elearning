class AnswersController < ApplicationController
  def new
    # ここで、次に学ぶwordを表示する
    @answer = Answer.new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find_by(id: @lesson.category_id)

    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.lesson_results)
      redirect_to root_url
    end
  end

  def create
    # ここで、ユーザーが選択した回答をDBに保存する
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:word_id, :choice_id)
    end
end
