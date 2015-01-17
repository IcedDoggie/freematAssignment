function serviceTime=Asg(customerAmt)
    ServiceTimeNum=ceil(100*rand(1,customerAmt));
    
   
    for j=1:customerAmt
        if ServiceTimeNum(j)>=1&&ServiceTimeNum(j)<=30
            sv(j)=1;
        elseif ServiceTimeNum(j)>30&&ServiceTimeNum(j)<=70
            sv(j)=2;
        elseif ServiceTimeNum(j)>70&&ServiceTimeNum(j)<=85
            sv(j)=3;
        elseif ServiceTimeNum(j)>85&&ServiceTimeNum(j)<=95
            sv(j)=4;
        elseif ServiceTimeNum(j)>95&&ServiceTimeNum(j)<=100
            sv(j)=5;
        end
     end
    
     
     
    IntelArrivalNum=ceil(100*rand(1,customerAmt));
    arrivalTime=(1:customerAmt); 
   
    for j=1:customerAmt
        if j == 1
            s(j) =0;
            IntelArrivalNum(j) =0;
            arrivalTime(j) = 0;
        elseif IntelArrivalNum(j)>=1&&IntelArrivalNum(j)<=20
            s(j)=1;
            arrivalTime(j) = arrivalTime(j-1) + s(j);
          
        elseif IntelArrivalNum(j)>=21&&IntelArrivalNum(j)<=40
            s(j)=2;
            arrivalTime(j) = arrivalTime(j-1) + s(j);
        elseif IntelArrivalNum(j)>=41&&IntelArrivalNum(j)<=50
            s(j)=3;
            arrivalTime(j) = arrivalTime(j-1) + s(j);
        elseif IntelArrivalNum(j)>=51&&IntelArrivalNum(j)<=60
             s(j)=4;
           arrivalTime(j) = arrivalTime(j-1) + s(j);
        elseif IntelArrivalNum(j)>=61&&IntelArrivalNum(j)<=70
            s(j)=5;
            arrivalTime(j) = arrivalTime(j-1) + s(j);
        elseif IntelArrivalNum(j)>=71&&IntelArrivalNum(j)<=85
            s(j)=6;
            arrivalTime(j) = arrivalTime(j-1) + s(j);
        elseif IntelArrivalNum(j)>=86&&IntelArrivalNum(j)<=100
            s(j)=7;
            arrivalTime(j) = arrivalTime(j-1) + s(j);
        
        
        end
     end
     
     serviceTime=(1:customerAmt); 
     serviceEnd=(1:customerAmt);
     waitingTime = (1:customerAmt);
     timeSpendInSystem = (1:customerAmt);
     
     for m=1:customerAmt
         if m ==1
             waitingTime(m) =0;
             timeSpendInSystem(m) = waitingTime(m) + sv(m);
             serviceTime(m) = 0;
             serviceEnd(m) = sv(m);
         else
             if(arrivalTime(m)>serviceEnd(m-1))
                 waitingTime(m) =0;
                 timeSpendInSystem(m) = waitingTime(m) + sv(m);   
                 serviceTime(m) = arrivalTime(m);
                 serviceEnd(m) = serviceTime(m) + sv(m);
             elseif(arrivalTime(m)<serviceEnd(m-1))
                 waitingTime(m)= serviceEnd(m-1)-arrivalTime(m);
                 timeSpendInSystem(m) = waitingTime(m) + sv(m);
                 serviceTime(m)= serviceEnd(m-1) + 1; 
                 serviceEnd(m) = serviceTime(m) + sv(m);
             else
                 waitingTime(m)=0;
                 timeSpendInSystem(m) = waitingTime(m) + sv(m);
                 serviceTime(m) = serviceEnd(m-1) + 1;
                 serviceEnd(m) = serviceTime(m) + sv(m);
     
             end
         endabc
     end
     
     disp('Cus_Num || Generated Num || Inter_Time || Arriv Time || RNserv || Serv Begin || Serv Time || Serv End || Time Spend || in queue');
     for i=1:customerAmt
     fprintf('%3d             %3d              %1d            %2d          %3d          %3d            %1d       %3d            %2d          %2d\n',[i     IntelArrivalNum(i) s(i)    arrivalTime(i)      ServiceTimeNum(i)      serviceTime(i)       sv(i)      serviceEnd(i)     timeSpendInSystem(i)      waitingTime(i)]);  
     
     end