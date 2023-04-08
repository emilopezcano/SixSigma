## Change RData to rds

dfs <- scan(text = "
ss.data.batteries                 
ss.data.bills                     
ss.data.bolts                     
ss.data.ca                        
ss.data.density                   
ss.data.doe1                      
ss.data.doe2                      
ss.data.pastries                  
ss.data.pb1                       
ss.data.pb2                       
ss.data.pb3                       
ss.data.pb4                       
ss.data.pc.big                    
ss.data.pc.r                      
ss.data.pc                        
ss.data.rr                        
ss.data.strings                   
ss.data.thickness                 
ss.data.thickness2                
ss.data.wbx                       
ss.data.wby", what = character())

for (df in dfs){
  do.call("use_data", list(as.name(df), overwrite = TRUE))
}

