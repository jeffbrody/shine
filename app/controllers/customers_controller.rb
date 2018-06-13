class CustomersController < ApplicationController
    def index
        if params.has_key? :keywords
            @keywords = params[:keywords]
            customer_search_term = CustomerSearchTerm.new(@keywords)
            @customers = []
             
             @customers = Customer.where(
                 customer_search_term.where_clause,
                 customer_search_term.where_args)#.
                 #order(customer_search_term.order)
         else
             @customers = []
         end
    end
end