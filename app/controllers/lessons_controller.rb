class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)

    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end

    #　スタートボタンを押すと、answerコントローラのnewアクションに遷移する
  end

  def show
    # answerのnew-createループが終了したら、このファンクションで結果ページを出す 
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers.paginate(page: params[:page], per_page: 5)
  end

end
