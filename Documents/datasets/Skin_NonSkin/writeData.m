fileID = fopen('theta1.txt','w');
for i=1:size(theta1_final,1)
    for j=1:size(theta1,2)
        fprintf(fileID,'%d ',theta1_final(i,j));
    end
    fprintf(fileID,'\n');
end
fclose(fileID);
fileID = fopen('theta2.txt','w');
for i=1:size(theta2_final,1)
    for j=1:size(theta2_final,2)
        fprintf(fileID,'%d ',theta2_final(i,j));
    end
    fprintf(fileID,'\n');
end
