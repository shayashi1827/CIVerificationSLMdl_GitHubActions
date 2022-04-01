pipeline {
  agent any
  stages {
    stage('verify') {
      steps {
        runMATLABCommand 'openProject(\'CruiseControlExample.prj\'), crs_controllerModelAdvisor'
      }
    }

    stage('build') {
      steps {
        runMATLABCommand 'openProject(\'CruiseControlExample.prj\'), crs_controllerBuild'
      }
    }

    stage('test') {
      steps {
        runMATLABCommand 'openProject(\'CruiseControlExample.prj\'), crs_controllerTestFile'
      }
    }

    stage('package') {
      steps {
        runMATLABCommand 'openProject(\'CruiseControlExample.prj\'), generateXMLFromLogs(\'crs_controller\'), generateHTMLReport(\'crs_controller\'), deleteLogs'
        archiveArtifacts artifacts: './Design/crs_controller/pipeline/analyze/**/*.*, ./Code/codegen/crs_controller_ert_rtw**/*.*'
      }
    }

  }
}