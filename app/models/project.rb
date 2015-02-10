class Project < ActiveRecord::Base

  enum status: {
           inprogress:    10,
           complete:      50,
           failed:        100
       }
end