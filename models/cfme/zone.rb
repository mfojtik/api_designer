module CFME

  class Zone < Entity

    href          :id

    string        :name
    string        :description

    array         :assigned_roles
    array         :ntp_servers

    collection    :systems

    timestamp     :created
    timestamp     :updated

    operation     :delete
    operation     :edit

  end
end
