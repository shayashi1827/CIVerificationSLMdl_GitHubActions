pipeline {
  agent any
  environment {
    projectname = "\'CruiseControlExample.prj\'"
  }
  stages {
    stages('crs_controller_test') {
      stage('verify') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), crs_controllerModelAdvisor'
        }
      }
      stage('build') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), crs_controllerBuild'
        }
      }
      stage('test') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), crs_controllerTestFile'
        }
      }
      stage('package') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), generateXMLFromLogs(\'crs_controller\'), generateHTMLReport(\'crs_controller\'), deleteLogs'
          archiveArtifacts artifacts: 'Design/crs_controller/pipeline/analyze/**/*.*, Code/codegen/crs_controller_ert_rtw**/*.*', fingerpoint: true
        }
      }
    }

    stages('driverSW_test') {
      stage('verify') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), DriverSwRequestModelAdvisor'
        }
      }
      stage('build') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), DriverSwRequestBuild'
        }
      }
      stage('test') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), DriverSwRequestTestFile'
        }
      }
      stage('package') {
        agent any
        steps {
          runMATLABCommand 'openProject(${projectname}), generateXMLFromLogs(\'DriverSwRequest\'), generateHTMLReport(\'DriverSwRequest\'), deleteLogs'
          archiveArtifacts artifacts: 'Design/DriverSwRequest/pipeline/analyze/**/*.*, Code/codegen/DriverSwRequest_ert_rtw**/*.*', fingerpoint: true
        }
      }
    }
  }
}