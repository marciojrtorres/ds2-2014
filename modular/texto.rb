# texto.rb
module Texto
    def Texto.palindrome?(s)
        s == s.reverse
    end

    def palindrome?
        self == self.reverse
    end
end

class String
    include Texto
end



