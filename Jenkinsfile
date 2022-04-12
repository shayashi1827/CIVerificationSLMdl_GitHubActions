pipeline {
  agent any
  tools {
       matlab 'R2021a'
   }
  environment {
    projectname = "\'CruiseControlExample.prj\'"
  }
  stages {
    stage('verify') {
      agent {
        node {
          customWorkspace 'workspace/verify'
        }
      }
      steps {
        parallel (
          "crs_controller" : {
            runMATLABCommand 'openProject(${projectname}), crs_controllerModelAdvisor'
          },
          "DriverSwRequest" : {
          runMATLABCommand 'openProject(${projectname}), DriverSwRequestModelAdvisor'
          }
        )
      }
    }
    
    stage('build') {
      agent {
        node {
          customWorkspace 'workspace/build'
        }
      }
      steps {
        parallel (
          "crs_controller" : {
            runMATLABCommand 'openProject(${projectname}), crs_controllerBuild'
          },
          "DriverSwRequest" : {
            runMATLABCommand 'openProject(${projectname}), DriverSwRequestBuild'
          }
        )
      }
    }
  }
}