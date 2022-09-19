function downloadTrainedDayDuskGeneratorNet(url,destination)
% The downloadTrainedDayDuskGeneratorNet function downloads the pretrained 
% UNIT generator network that translates day images into dusk images and
% vice versa.
%
% Copyright 2020 The MathWorks, Inc.

[~,name,~] = fileparts(url);
netDirFullPath = destination;
netZipFileFullPath = fullfile(destination,[name '.zip']);
netMATFileFullPath = fullfile(destination,[name '.mat']);
if ~exist(netMATFileFullPath,'file')
    if ~exist(netZipFileFullPath,'file')
        if ~exist(netDirFullPath,'dir')
            mkdir(netDirFullPath);
        end
        websave(netZipFileFullPath,url);
    end
    unzip(netZipFileFullPath,netDirFullPath)
end