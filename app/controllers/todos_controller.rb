class TodosController < ApplicationController

    #GET /todos
    def index
      @todos = Todo.all
    end

    #GET /todos/1
    def show
      @todo = Todo.find(params[:id])
    end    

    #GET /todos/new
    def new
      @todo = Todo.new
    end    

    #POST /todos  サーバーにデータを送信するリクエスト
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to @todo, notice:'作成しました‼' #このリダイレクトは自動的にshowにいく（idを取得して作られているから
      else
        render :new  # バリデーションエラーがあった場合、再度新規作成フォームを表示する
      end
    end    

    # GET /todos/1/edit
    def edit 
      @todo = Todo.find(params[:id])  
    end

    # PATCH /todos/1 #サーバー上のリソースを更新するためのリクエスト
    def update
      @todo = Todo.find(params[:id])  
      if @todo.update(todo_params)
        redirect_to @todo, notice: '更新しました‼'
      else
        render :edit
      end
    end      

    #DELETE /todos/1
    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to todos_url, notice: '削除しました'    #indexに自動的に飛ぶ
    end    

    private  #ストロングパラメーター
    def todo_params
        params.require(:todo).permit(:title, :completed)  #todo_paramsにタイトルとコンプリートだけを許可する
    end
end      
