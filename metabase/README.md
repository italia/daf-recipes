## Metabase + postgres + ldap configuration ##

Follow these steps to run the Docker images:

    git clone https://github.com/lorenzoeusepi77/metabase_last.git
    cd metabase_last/docker/
    ./build_local.sh        #it will build the images needed by docker-compoose
    docker-compose up -d    # it will run all the needed containers

Then you can open the metabase home http://localhost:3000 

# Ldap configuration:

- Create "admin" user:
    
<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase01.png" />
    


- Configure admin user database:
    
<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase02.png" />

    
    
- Login to Metabase with "admin" credential:
        "EMail" and "Password"
    


- Click on top right corner menù and select "Admin Panel":
    
<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase03.png" />



- On Left menù click "Authentication" -- "LDAP" -- "Configure"
    
<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase04.png" />
    


- Insert Ldap server parameter: 



<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase05.png" />
        


- Is possible to "Synchronize group memberships" and map Ldap Groups with Metabase Groups:
    
  Click on "Edit Mappings"  
  
  
  
<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase06.png" />
        
        
  And configure Groups mapping
  
  
  
<img src="https://raw.githubusercontent.com/lorenzoeusepi77/metabase/master/images/metabase07.png" />
        
        
  Save all LDAP parameter and "Save changes"
    
  Now you can logout with local "admin" user and login with LDAP users.
    
