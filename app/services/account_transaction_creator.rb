class AccountTransactionCreator
    def initialize(params)
        @params = params
    end

    def call
        create_account_transaction
    end

    private

    def create_account_transaction
        AccountTransaction.new(@params)
    end
end