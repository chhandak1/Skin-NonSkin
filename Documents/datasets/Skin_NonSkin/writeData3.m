
fileID = fopen('xtestDataTwenty.txt','w');
for i=1:size(xtest,1)
    for j=1:size(xtest,2)
        fprintf(fileID,'%d ',xtest(i,j));
    end
    fprintf(fileID,'\n');
end
fclose(fileID);

fileID = fopen('ytestDataTwenty.txt','w');
for i=1:size(ytest,1)
    fprintf(fileID,'%d ',ytest(i));
    fprintf(fileID,'\n');
end


fileID = fopen('outputTwenty.txt','w');
for i=1:size(output,1)
    fprintf(fileID,'%d ',output(i));
    fprintf(fileID,'\n');
end
