function [Data,timeVals,trialNums,goodTrials,BadTrials]=ExtractGoodData(a,e,s,f,o,c,t,aa,ae,as,ao,av,at,folderExtract,anaCh,timInfo,badElec,refCh,UpLim,LowLim,DCToggle)
% added by Murty V P S Dinavahi 19-09-2014

    % Load Trial Numbers for the given Parameter Combinations
    [parameterCombinations] = loadParameterCombinations(folderExtract);
    trialNums = cell2mat(parameterCombinations(a,e,s,f,o,c,t,aa,ae,as,ao,av,at));
    
    if ~isempty(trialNums) && ~strcmp(anaCh,'None')
    
        % Load the specific file
        load([anaCh]);
        load([timInfo]);     

        cutOffAmp = 50;

        % Extraction
        goodTrials = setdiff(trialNums,badElec);
        anaData=analogData(goodTrials,:);
        clear analogData;

        % Referencing
        if (strcmp(refCh,'None') == 1)
            tempData = anaData;
        else
            load ([refCh]);
            if (exist('averageData','var'))
                refData = averageData(goodTrials,:);
            else
                refData = analogData(goodTrials,:);
            end
            tempData = anaData - refData;        
        end        

        % Correction of DC shift
        if DCToggle == 1
            for i=1:size(tempData,1)
                blZero = (find(timeVals == 0));
                blPeriod = (blZero-500):blZero;
                corData(i,:)=(tempData(i,:)-mean(tempData(i,blPeriod)));
            end
        else
            corData = tempData;
        end

        % Apply visual correction
        BadTrials=[];
        for i=1:size(corData,1)
            if ((~isempty(find(corData(i,:)>UpLim,1))) || (~isempty(find(corData(i,:)<LowLim,1))))
                BadTrials=[BadTrials i];
            end
        end
        RenumGoodTrials=1:length(goodTrials);
        finalTrials=setdiff(RenumGoodTrials,BadTrials);
        Data = corData(finalTrials,:); 
    else
        Data = [];
        timeVals = [];
        trialNums = 0;
        goodTrials = 0;
        BadTrials = 0;
    end
end
