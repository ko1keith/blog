class ArticlesController < ApplicationController

    #show single article
    def show 
        @article = Article.find(params[:id])
    end

    #display all articles from database
    def index 
        @articles = Article.all
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
        @article = Article.new(params.require(:article).permit(:title, :description))
        
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
        @article = Article.find(params[:id])
    end

    #take edited form and update to database
    def update 
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title,:description))
            flash[:notice] = "Article was updated succesfully."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def destroy 
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

end