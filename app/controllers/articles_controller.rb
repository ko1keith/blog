class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    #show single article
    def show 
    end

    #display all articles from database
    def index 
        @articles = Article.paginate(page: params[:page], per_page:9)
    end

    #display new article page
    def new
        #for first time page loads
        @article = Article.new
    end

    #take form from new article page, create new article and add to database
    def create 
        #white list article params
        #require top level key of article and only permit title and description parameters
        @article = Article.new(article_params)
        @article.user = User.first
        
        #if validation fails, display error message
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
            
        else
            render 'new'
        end
    end

    #find article and display the form
    def edit
    end

    #take edited form and update to database
    def update 
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def destroy 
        @article.destroy
        redirect_to articles_path
    end

    private
    #find article and set instance variable
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end