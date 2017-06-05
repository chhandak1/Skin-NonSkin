fileID = fopen('CaucasianNonCaucasianData.txt','w');
for i=1:size(skinColorFinal,1)
    for j=1:size(skinColorFinal,2)
        fprintf(fileID,'%d ',skinColorFinal(i,j));
    end
    fprintf(fileID,'\n');
end