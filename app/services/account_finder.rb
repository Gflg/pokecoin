class AccountFinder
    def initialize(params={})
        @params = params
    end

    def call
        if @params == {}
            find_all_accounts
        else
            find_account
        end
    end

    private

    def find_all_accounts
        Account.all
    end

    def find_account
        Account.find(@params[:id])
    end
end