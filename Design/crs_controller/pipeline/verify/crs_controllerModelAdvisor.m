% Copyright 2021 The MathWorks, Inc.
ma = modelAdvisorAction('crs_controller'); 
ma.configFile = './tools/utilities/config_data/iso26262Checks.json';
ma =  ma.run();
ma.generateReport();