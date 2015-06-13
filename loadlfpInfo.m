function [analogChannelsStored,timeVals,goodStimPos,analogInputNums,electrodesStored] = loadlfpInfo(folderLFP) %#ok<*STOUT>
load(fullfile(folderLFP,'lfpInfo'));

if ~exist('analogInputNums','var'); analogInputNums=[]; end;
if ~exist('goodStimPos','var'); goodStimPos = []; end;

end