% Copyright 2021 The MathWorks, Inc.
ma = modelAdvisorAction('DriverSwRequest');
prj = currentProject;
ma.configFile = fullfile(prj.RootFolder, 'tools/utilities/config_data/iso26262Checks.json');
ma = ma.run(); 
ma.generateReport();