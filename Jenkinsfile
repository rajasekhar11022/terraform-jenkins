pipeline{
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages{

    stage('S3 - create bucket'){
      steps{
        script{
          createS3Bucket('terraformraviraja')
        }
      }
    }

    stage('terraform init and apply - dev'){
      steps{
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init"
        sh "terraform destroy -var-file=dev.tfvars -auto-approve"
      }
    }

  }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
  return tfHome
}

def createS3Bucket(bucketName){
  sh returnStatus: true, script: "aws s3 mb ${bucketName} --region=us-east-1"
}
