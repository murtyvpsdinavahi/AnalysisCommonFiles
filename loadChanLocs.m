function [chanlocs,hemBipolarLocs,bipolarLocs] = loadChanLocs(gridMontage,refType)

if nargin<2;    refType = 1; end

if strcmp(gridMontage,'actiCap64')
    if (refType == 4)
        load(fullfile(pwd,'Montages','bipolarChanlocsActiCap64.mat'));
        chanlocs = eloc;
    else
        load(fullfile(pwd,'Montages','actiCap64.mat'));
    end
    load(fullfile(pwd,'Montages','hemBipChInfoActiCap_64.mat'));
    load(fullfile(pwd,'Montages','bipChInfoActiCap64.mat'));
    
elseif strcmp(gridMontage,'brainCap64')
    if (refType == 4)
        load(fullfile(pwd,'Montages','bipolarChanlocsBrainCap64.mat'));
        chanlocs = eloc;
    else
        load(fullfile(pwd,'Montages','brainCap64.mat'));
    end
    load(fullfile(pwd,'Montages','hemBipChInfoBrainCap_64.mat'));
    load(fullfile(pwd,'Montages','bipChInfoBrainCap64.mat'));
    
else % Default condition: actiCap64
    if (refType == 4)
        load(fullfile(pwd,'Montages','bipolarChanlocsActiCap64.mat'));
        chanlocs = eloc;
    else
        load(fullfile(pwd,'Montages','actiCap64.mat'));
    end
    load(fullfile(pwd,'Montages','hemBipChInfoActiCap_64.mat'));
    load(fullfile(pwd,'Montages','bipChInfoActiCap64.mat'));
end

end