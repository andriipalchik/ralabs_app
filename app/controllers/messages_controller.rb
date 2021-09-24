class MessagesController < ApplicationController
    
    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end
    
    def new
        @message = Message.new(message_params)
        respond_to do |format|
          if @message.save
            format.html { redirect_to @message, notice: 'Message was successfully created.' }
            format.json { render :show, status: :created, location: @message }
          else
            format.html { render :new }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end 
    end
        
    def show
        @message = Message.find(params[:id])
        @message.destroy
        respond_to do |format|
            format.html { redirect_to :action => :show,  status: 303, notice: 'Message was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    private

    def set_message
        @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:body)
    end
end
