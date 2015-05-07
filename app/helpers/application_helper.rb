module ApplicationHelper
    def connect_to_mysql
        require 'mysql2'
        
        if (@con = Mysql2::Client.new(host: '127.0.0.1',
                                      username: 'root',
                                      password: '',
                                      database: 'videorental'
                                      ))
                                      else
                                      fail 'Could not connect'
        end
    end
    
    def a
        5
    end
end
