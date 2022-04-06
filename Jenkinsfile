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
            archiveArtifacts artifacts: 'Design/crs_controller/pipeline/analyze/**/*.*, Code/codegen/crs_controller_ert_rtw**/*.*', fingerprint: true
          }
        }
      }
    }

    stage('TargetSpeedThrottle_test') {
      agent any
      
      stages {
        stage('verify') {
          steps {
            runMATLABCommand 'openProject(${projectname}), TargetSpeedThrottleModelAdvisor'
          }
        }
        stage('build') {
          steps {
            runMATLABCommand 'openProject(${projectname}), TargetSpeedThrottleBuild'
          }
        }
        stage('test') {
          steps {
            runMATLABCommand 'openProject(${projectname}), TargetSpeedThrottleTestFile'
          }
        }
        stage('package') {
          steps {
            runMATLABCommand 'openProject(${projectname}), generateXMLFromLogs(\'TargetSpeedThrottle\'), generateHTMLReport(\'TargetSpeedThrottle\'), deleteLogs'
            archiveArtifacts artifacts: 'Design/TargetSpeedThrottle/pipeline/analyze/**/*.*, Code/codegen/TargetSpeedThrottle_ert_rtw**/*.*', fingerprint: true
          }
        }
      }
    }
  }
}