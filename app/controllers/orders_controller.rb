class OrdersController < ApplicationController
    # GET /buy
    def buy
      Stripe.api_key = "sk_test_51JtOgyFfeA45SmyCiW7WGpTRDRHovWV0F6D4oOxHDhVGowTHvtMzxOlHeyawRE5rJyVlkEctm0RhwQ3S07Ohtv1z000usO3RYs"
      
      book = Book.find(params[:book_id])

      line_item = {
        price_data: {
          currency: 'aud',
          product_data: {
            name: book.title,
          },
          unit_amount: book.price,
        },
        quantity: 1,
      }

      session = Stripe::Checkout::Session.create({
          payment_method_types: ['card'],
          line_items: [line_item],
          mode: 'payment',
          # These placeholder URLs will be replaced in a following step.
          #www.blah.com/success?session_id={CHECKOUT_SESSION_ID}"
          success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
          cancel_url: cancel_url,
        })

        redirect_to session.url
    end

    def success
    end

    def cancel
    end
end
