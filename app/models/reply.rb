class Reply < ActiveRecord::Base
    # 하나에 종속되어 있으니까 단수로 적어도됨.
    belongs_to :post
    belongs_to :user
end
