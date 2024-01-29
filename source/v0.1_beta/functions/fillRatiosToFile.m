function fillRatiosToFile(fillRatios)
% FILLRATIOSTOFILE Given fill ratio/set of fill ratios, output range of gravity values and
% other mechanical analogies-related parameters
    fillratio_dat = magic(5);
    writematrix(fillratio_dat,'M_tab.txt','Delimiter','tab')
end

