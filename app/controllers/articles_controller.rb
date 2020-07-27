class ArticlesController < ApplicationController

    def show 
        @article = Article.find(params[:id])
    end

    def index 
        @articles = Article.all
    end

    def new
        #for first time page loads
        @article = Article.new
    end

    def create 
        #white list article params
        #require top level key of article and only permit title and description parameters
        @article = Article.new(params.require(:article).permit(:title, :description))
        
        #if validation fails, display error message
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
            
        else
            render 'new'
        end
    end
    

end