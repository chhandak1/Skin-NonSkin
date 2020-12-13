fileID = fopen('errorGSO.txt','w');
for it=1:size(errorGSO,1)
    fprintf(fileID,'%d ',errorGSO(it));
end