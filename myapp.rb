# myapp.rb
require 'sinatra'
require 'pony'

get '/' do
  erb :index, layout: :main_layout
end

post "/capitalize" do
  params[:text_to_capitalize].capitalize
end

get "/take_survey" do
  erb :survey, layout: :main_layout
end

get "/contact_me" do
  erb :contact_me
end

post "/email" do
  Pony.mail(:to => "tammam.kbeili@gmail.com", 
            :from => params[:email], 
            :subject => params[:subject], 
            :body => params[:body])
  # Pony.mail({
  #   :to => 'tammam.kbeili@gmail.com',
  #     :from => "answerawesome@gmail.com",
  #     subject: "Hello World",
  #   :via => :smtp,
  #   :via_options => {
  #     :address        => 'smtp.gmail.com',
  #     :port           => '587',
  #     :enable_starttls_auto => true,
  #     :user_name      => 'answerawesome',
  #     :password       => 'Sup3r$ecret',
  #     :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
  #     :domain         => "awesomeanswer.com" # the HELO domain provided by the client to the server
  #   }
  # })

end

post "/survey_results" do
  if params[:work_best] == "with_deadlines"
    if params[:consider_yourself] == "rational"
      if params[:interested_in] == "facts"
        "You Are Guardian"
      elsif params[:interested_in] == "ideas"
        "You Are Rational"
      end
    elsif params[:consider_yourself] == "compassionate"
      if params[:interested_in] == "facts"
        "You Are Guardian"
      elsif params[:interested_in] == "ideas"
        "You Are Idealist"
      end
    end
  elsif params[:work_best] == "without_deadlines"
    if params[:consider_yourself] == "rational"
      if params[:interested_in] == "facts"
        "You Are Artisan"
      elsif params[:interested_in] == "ideas"
        "You Are Rational"
      end
    elsif params[:consider_yourself] == "compassionate"
      if params[:interested_in] == "facts"
        "You Are Artisan"
      elsif params[:interested_in] == "ideas"
        "You Are Idealist"
      end
    end
  end
end