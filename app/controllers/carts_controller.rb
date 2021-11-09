class CartsController < ApplicationController
    # GET /add_to_cart
    def add_to_cart
        book = Book.find(params[:book_id])
        current_user.cart.books << book
        flash[:notice] = "Book added to cart"
        redirect_to book
    end

    def cart
        @books = current_user.cart.books
    end

    def buy
        Stripe.api_key = "sk_test_51JtOgyFfeA45SmyCiW7WGpTRDRHovWV0F6D4oOxHDhVGowTHvtMzxOlHeyawRE5rJyVlkEctm0RhwQ3S07Ohtv1z000usO3RYs"
        
        line_items = current_user.cart.books.map do |book|
            {
            price_data: {
                currency: 'aud',
                product_data: {
                    name: book.title,
                },
                unit_amount: book.price,
                },
                quantity: 1, 
            }
        end
  
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: line_items,
            mode: 'payment',
            # These placeholder URLs will be replaced in a following step.
            #www.blah.com/success?session_id={CHECKOUT_SESSION_ID}"
            success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: cancel_url,
          })
  
          redirect_to session.url
      end
end
