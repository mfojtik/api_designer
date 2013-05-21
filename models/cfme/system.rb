module CFME

  class System < Entity

    href          :id
    string        :name

    timestamp     :created
    timestamp     :updated

    ref           :zone

  end

end
