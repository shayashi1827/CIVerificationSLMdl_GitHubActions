pipeline {
  agent any
  tools {
       matlab 'R2021a'
   }
  environment {
    projectname = "\'CruiseControlExample.prj\'"
    mdlname = "\'crs_controller\'"
  }
  stages {
    stage('verify') {
      steps {
            runMATLABCommand 'openProject(${projectname}), crs_controllerModelAdvisor'
      }
    }
    stage('testing') {
      steps {
            runMATLABCommand 'openProject(${projectname}), crs_controllerTestFile'
      }
    }
    stage('build') {
      steps {
            runMATLABCommand 'openProject(${projectname}), crs_controllerBuild'
      }
    }
    stage('package') {
      steps {
            runMATLABCommand 'openProject(${projectname}),  generateXMLFromLogs(${mdlname});, generateHTMLReport(${mdlname});'
            archiveArtifacts artifacts: 'Design/crs_controller/pipeline/analyze/**/*, Code/codegen/crs_controller_ert_rtw/**/*',
                               onlyIfSuccessful: true
      }
    }
  }
}