% Written by Supratim; used as is by MD

function [parameterCombinations,aValsUnique,eValsUnique,sValsUnique,...
    fValsUnique,oValsUnique,cValsUnique,tValsUnique,aaValsUnique,aeValsUnique,asValsUnique,aoValsUnique,avValsUnique,atValsUnique,rValsUnique,pValsUnique] = loadParameterCombinations(folderExtract)

load(fullfile(folderExtract,'parameterCombinations.mat'));

if ~exist('rValsUnique','var')
    rValsUnique=[];
end

if ~exist('sValsUnique','var')
    sValsUnique=rValsUnique;
end

if ~exist('cValsUnique','var')
    cValsUnique=[];
end

if ~exist('tValsUnique','var')
    tValsUnique=[];
end

if ~exist('pValsUnique','var')
    pValsUnique=[];
end

if ~exist('aaValsUnique','var')
    aaValsUnique=[];
end

if ~exist('aeValsUnique','var')
    aeValsUnique=[];
end

if ~exist('asValsUnique','var')
    asValsUnique=[];
end

if ~exist('aoValsUnique','var')
    aoValsUnique=[];
end

if ~exist('avValsUnique','var')
    avValsUnique=[];
end

if ~exist('atValsUnique','var')
    atValsUnique=[];
end

end

