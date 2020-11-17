class CashRegister
    attr_accessor :discount, :total, :items, :prices

    def initialize(discount=0.0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item (title, price, quantity=1)
        quantity.times {@items << title}
        @prices << price
        self.total += (price * quantity)
    end

    def apply_discount
        if self.discount > 0
            self.total -= (self.total * self.discount / 100)
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        if self.prices.length == 1
            self.total = 0.0
        else
            self.total -= self.prices[self.prices.length - 1]
        end
    end 
end
