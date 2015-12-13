
function [Data,trialNums,allBadTrials]=getDataGAV(a,e,s,f,o,c,t,aa,ae,as,ao,av,at,folderName,folderLFP,analogChannels,waitbarFlag)
    
    if ~exist('waitbarFlag','var')||isempty(waitbarFlag); waitbarFlag = 1; end;
    
    % Load Trial Numbers for the given Parameter Combinations
    folderExtract = fullfile(folderName,'extractedData');
    folderSegment = fullfile(folderName,'segmentedData');
    
    [parameterCombinations] = loadParameterCombinations(folderExtract);
    
    trialNums = cell2mat(parameterCombinations(a,e,s,f,o,c,t,aa,ae,as,ao,av,at));
    
    try
        load(fullfile(folderSegment,'badTrials.mat')); 
    catch
        allBadTrials = cell(size(analogChannels,2),1);
    end
    
    % Extraction
    if waitbarFlag
        hWD = waitbar(0,['Extracting 1 of ' num2str(size(analogChannels,2)) ' electrodes...']);
    end
    for iC = 1:size(analogChannels,2)
        if waitbarFlag
            waitbar((iC/size(analogChannels,2)),hWD,['Extracting ' num2str(iC) ' of ' num2str(size(analogChannels,2)) ' electrodes...']);
        end
        analogData = loadAnalogData(fullfile(folderLFP,['elec' num2str(analogChannels(iC)) '.mat']));
        Data(iC,:,:)=analogData(trialNums,:);
        clear analogData
    end
    if waitbarFlag
        close(hWD);
    end
    clear hWD;
    
end