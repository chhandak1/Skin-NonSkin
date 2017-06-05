%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Galactic Swarm Optimization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [galaxy_x,best_cost]=nmgso(fname,ndims)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%--Setting of Parameters and function begin--%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=fname;

%--D--%%----EPmax-----%%----L1-------%%-----L2------%%---N---%%---M--%%
dim=ndims;
epochnumber=10;
Iteration1=200;
Iteration2=500;
PopSize=5;
subpop=20;


%dim=3;epochnumber=10;Iteration1=200;Iteration2=1500;PopSize=5;subpop=20;good


xmin= 0;  
xmax= 255;

vmin=-10;
vmax=10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%--Setting of Parameters and function end--%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





c1 = 2.05*rand;
c2 = 2.05*rand;
c3 = 2.05*rand;
c4 = 2.05*rand;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialization of position and velocity vectors begins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for num=1:subpop
    for p=1:PopSize
        gal(num).particle(p).x = xmin + (xmax-xmin)*rand(1,dim);
        gal(num).particle(p).cost = f(gal(num).particle(p).x);
        gal(num).particle(p).v =  vmin + (vmax-vmin)*rand(1,dim);
        gal(num).particle(p).pbest=xmin + (xmax-xmin)*rand(1,dim);
        if f(gal(num).particle(p).x)<f(gal(num).particle(p).pbest)
            gal(num).particle(p).pbest=gal(num).particle(p).x;
        end
        gal(num).particle(p).pbest_c=f(gal(num).particle(p).pbest);
    end
    gal(num).xgbest=gal(num).particle(1).pbest;
    gal(num).cgbest=f(gal(num).xgbest);
    for p=2:PopSize
        if f(gal(num).particle(p).pbest)<gal(num).cgbest
            gal(num).xgbest=gal(num).particle(p).pbest;
            gal(num).cgbest=f(gal(num).particle(p).pbest);
        end
    end
end
galaxy_x=gal(1).xgbest;
galaxy_c=f(galaxy_x);

for num=2:subpop
    if f(gal(num).xgbest)<galaxy_c
        galaxy_x=gal(num).xgbest;
        galaxy_c=f(gal(num).xgbest);
    end
end
for p=1:subpop
    particle(p).v=vmin + (vmax-vmin)*rand(1,dim);
    particle(p).pbest=xmin+(xmax-xmin)*rand(1,dim);
    particle(p).pbest_c=f(particle(p).pbest);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialization of position and velocity vector ends
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %Initialization of counter for function calls


for epoch=1:epochnumber
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%-----------Level 1-------------%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for num=1:subpop
        
        for r=0:Iteration1
            
            for p=1:PopSize
                
                r1 = -1+2*rand;
                r2 = -1+2*rand;
                
                v = c1*r1*(gal(num).particle(p).pbest - gal(num).particle(p).x) + c2*r2*(gal(num).xgbest - gal(num).particle(p).x);
                
                gal(num).particle(p).v = (1-r/(Iteration1+1))*gal(num).particle(p).v + v;
                
                gal(num).particle(p).v = max(gal(num).particle(p).v,vmin);
                
                gal(num).particle(p).v = min(gal(num).particle(p).v,vmax);
                
                gal(num).particle(p).x = gal(num).particle(p).x +gal(num).particle(p).v;
                
                gal(num).particle(p).x  = max(gal(num).particle(p).x ,xmin);
                
                gal(num).particle(p).x  = min(gal(num).particle(p).x ,xmax);
                
                gal(num).particle(p).cost = f(gal(num).particle(p).x);
                
                
                if gal(num).particle(p).cost < gal(num).particle(p).pbest_c
                    gal(num).particle(p).pbest = gal(num).particle(p).x;
                    gal(num).particle(p).pbest_c = gal(num).particle(p).cost;
                    
                    if gal(num).particle(p).pbest_c < gal(num).cgbest
                        gal(num).xgbest = gal(num).particle(p).pbest;
                        gal(num).cgbest = gal(num).particle(p).pbest_c;
                        
                        if gal(num).cgbest < galaxy_c
                            galaxy_x = gal(num).xgbest;
                            galaxy_c = gal(num).cgbest;
                        end
                    end
                end
                
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%------Level 2---------------%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for p=1:subpop
        particle(p).x = gal(p).xgbest;
        particle(p).cost = gal(p).cgbest;
        particle(p).pbest=particle(p).x;
        particle(p).pbest_c=gal(p).cgbest;
        %         particle(p).v=particle(p).x;
    end
    
    for r=0:Iteration2
        for p=1:subpop
            
            r3 = -1+2*rand;
            r4 = -1+2*rand;
            
            v =  c3*r3*(particle(p).pbest - particle(p).x)+ c4*r4*(galaxy_x - particle(p).x);
            
            particle(p).v = (1-r/(Iteration2+1))*particle(p).v + v;
            
            particle(p).v = max(particle(p).v,vmin);
            
            particle(p).v = min(particle(p).v,vmax);
            
            particle(p).x = particle(p).x +particle(p).v;
            
            particle(p).x = max(particle(p).x,xmin);
            
            particle(p).x = min(particle(p).x,xmax);
            
            particle(p).cost = f(particle(p).x);
           
            
            if particle(p).cost < particle(p).pbest_c
                particle(p).pbest = particle(p).x;
                particle(p).pbest_c = particle(p).cost;
                
                if particle(p).pbest_c < galaxy_c
                    galaxy_x = particle(p).pbest;
                    galaxy_c = particle(p).pbest_c;
                end
            end
        end
        
    end
    
    
end





galaxy_x = fminsearch(f,galaxy_x);

best_cost = f(galaxy_x);



