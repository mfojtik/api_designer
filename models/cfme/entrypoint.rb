module CFME

  class EntryPoint < Entity

    href          :id
    string        :name

    collection    :zones
    collection    :repositories
    collection    :services

  end

end
