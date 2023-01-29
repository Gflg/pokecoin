class AccountTransactionFinder
    def initialize(params={})
        @params = params
    end

    def call
        if @params == {}
            get_all_account_transactions
        else
            filter_and_order_account_transactions
        end
    end

    private

    def filter_and_order_account_transactions
        AccountTransaction.where(@params).order('created_at DESC')
    end

    def get_all_account_transactions
        AccountTransaction.all
    end
end