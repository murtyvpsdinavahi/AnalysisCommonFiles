function [SRaw,SChange,t,f] = getSTFT(analogData,movingWin,mtmParams,timeVals,BLMin,BLMax)

    [SRaw,t,f]=mtspecgramc(analogData',movingWin,mtmParams);
    t = t + timeVals(1); % shift the t values to the actual time
    tBL = intersect(find(t>=BLMin),find(t<=BLMax)); % baseline time indices
    
    SRawBL = SRaw(tBL,:,:);
    
    mlogSRawBL = conv2Log(mean(mean(SRawBL,1),3));
    SChange = 10*(conv2Log(mean(SRaw,3)) - repmat(mlogSRawBL,size(SRaw,1),1));
    SRaw = 10*(conv2Log(mean(SRaw,3)));

%     mlogSRawBL = (mean(mean(conv2Log(SRawBL),1),3));
%     SChange = 10*((mean(conv2Log(SRaw),3)) - repmat(mlogSRawBL,size(SRaw,1),1));
%     SRaw = 10*(mean(conv2Log(SRaw),3));
    
end
