class SimsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        post = Post.find(params[:post_id])
        sim = post.sims.build(sim_params) #buildを使い、contentとtweet_idの二つを同時に代入
        sim.user_id = current_user.id
        if sim.save
          flash[:success] = "SIM情報を登録しました"
          redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        else
          flash[:success] = "SIM情報を登録できませんでした"
          redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        end
    end
    def edit
        @sim = Sim.find(params[:id])
    end
    def update
      sim = Sim.find(params[:id])
      if sim.update(sim_params)
        redirect_to post_path(sim.post)  # Simに紐づくPostのshowページにリダイレクト
      else
        redirect_back(fallback_location: root_path)
      end
    end
    def destroy
      @post = Post.find(params[:post_id])
      @sim = @post.sims.find(params[:id])
      @sim.destroy
      redirect_to post_path(@post), notice: 'SIM情報が削除されました'
    end
  private
    def sim_params
      params.require(:sim).permit(:career,:review,:star)
    end
end
