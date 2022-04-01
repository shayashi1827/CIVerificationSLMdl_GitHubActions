pipeline {
  agent any
  stages {
    stage('verify') {
      steps {
        runMATLABCommand 'openProjectr(\'CruiseControlExample.prj\'); crs_controllerModelAdvisor;'
      }
    }

    stage('build') {
      steps {
        runMATLABCommand 'openProjectr(\'CruiseControlExample.prj\'); crs_controllerBuild;'
      }
    }

    stage('test') {
      steps {
        runMATLABCommand 'openProjectr(\'CruiseControlExample.prj\'); crs_controllerTestFile;'
      }
    }

    stage('package') {
      steps {
        runMATLABCommand 'openProjectr(\'CruiseControlExample.prj\'); generateXMLFromLogs(\'crs_controller\'); generateHTMLReport(\'crs_controller\'); deleteLogs;'
      }
    }

  }
}