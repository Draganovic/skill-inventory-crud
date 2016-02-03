

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = ["skill1", "skill2", "skill3"]
    erb :index
  end

  get '/skills/new' do
    erb :new
  end


end
