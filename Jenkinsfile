pipeline {
  agent any
  environment {
    projectname = "\'CruiseControlExample.prj\'"
  }
  stages {
    stage('crs_controller_test') {
      agent any
      
      stages {
        stage('verify') {
          steps {
            runMATLABCommand 'openProject(${projectname}), crs_controllerModelAdvisor'
          }
        }
        stage('build') {
            steps {
            runMATLABCommand 'openProject(${projectname}), crs_controllerBuild'
          }
        }
        stage('test') {
          steps {
            runMATLABCommand 'openProject(${projectname}), crs_controllerTestFile'
          }
        }
        stage('package') {
          steps {
            runMATLABCommand 'openProject(${projectname}), generateXMLFromLogs(\'crs_controller\'), generateHTMLReport(\'crs_controller\'), deleteLogs'
            archiveArtifacts artifacts: 'Design/crs_controller/pipeline/analyze/**/*.*, Code/codegen/crs_controller_ert_rtw**/*.*', fingerpoint: true
          }
        }
      }
    }

    stage('driverSW_test') {
      agent any
      
      stages {
        stage('verify') {
          steps {
            runMATLABCommand 'openProject(${projectname}), DriverSwRequestModelAdvisor'
          }
        }
        stage('build') {
          steps {
            runMATLABCommand 'openProject(${projectname}), DriverSwRequestBuild'
          }
        }
        stage('test') {
          steps {
            runMATLABCommand 'openProject(${projectname}), DriverSwRequestTestFile'
          }
        }
        stage('package') {
          steps {
            runMATLABCommand 'openProject(${projectname}), generateXMLFromLogs(\'DriverSwRequest\'), generateHTMLReport(\'DriverSwRequest\'), deleteLogs'
            archiveArtifacts artifacts: 'Design/DriverSwRequest/pipeline/analyze/**/*.*, Code/codegen/DriverSwRequest_ert_rtw**/*.*', fingerpoint: true
          }
        }
      }
    }
  }
}