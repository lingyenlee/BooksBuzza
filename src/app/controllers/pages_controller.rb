class PagesController < ApplicationController
    
    def home
           # create a session and store the session on the stripe server
       generate_stripe_session
    end


    def donated    
    end
    
    private
    
    def generate_stripe_session

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            # customer_email: current_user.email,
            line_items: [{
            name: "Donate to Books Buzza!",
            currency: 'aud',
            quantity: 1,
            amount: 1000
            }],
            # payment_intent_data: {
            #     metadata: {user_id: current_user.id,}
            # },
                # success_url: "#{root_url}pages/donated?userId=#{current_user.id}",
                success_url: "#{root_url}pages/donated?userId=0",
                cancel_url: "#{root_url}"
            )
            
            @session_id = session.id
    end
       
end