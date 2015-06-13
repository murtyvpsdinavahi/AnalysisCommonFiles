minTime = 0.1;
maxTime = 0.9;
dFs=2000;

TimeRange = ([minTime maxTime]);
nTR = (dFs*diff(TimeRange)); 

Data = ParameterData.Data;
timeVals = ParameterData.timeVals;
TRPos= find(timeVals>=TimeRange(1),1) + (1:nTR);

for z=1:size(Data,1)
    trialRMS(1,z) = rms(Data(z,TRPos));
    av(1,z)=z;
end

figure; hold on;
scatter(av,trialRMS,'*','r'); hold on;
hold off;
