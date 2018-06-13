class AddEmailConstraintToUsers < ActiveRecord::Migration[5.2]
  def up
      execute %{
        delete from users where email not like '%@example.com';
      }
      
      execute %{
        alter table
            users
        add constraint
            email_must_be_company_email
        check(email ~*'^[^@]+@example\\.com$')
      }
  end
    
  def down
      execute %{
        alter table
            users
        add constraint
            email_must_be_company_email        
      }
  end
end
