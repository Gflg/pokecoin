class AccountCreator
    def initialize(params={})
        @params = params
    end

    def call
        create_account
    end

    private

    def create_account
        Account.new(@params)
    end
end