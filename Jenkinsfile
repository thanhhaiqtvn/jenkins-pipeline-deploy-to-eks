#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
        // IAM_ROLE = "arn:aws:iam::012345678910:role/eks-role"
        // CLUSTER_NAME = "myapp-eks-cluster" //eks-cluster
        // ECR_URL = "167693783846.dkr.ecr.us-east-2.amazonaws.com/cicd-node-sample"
        // CLUSTER_NAME = "myapp-eks-cluster"
        KUBECTL_PATH = '/usr/local/bin/kubectl'
        EKS_NAMESPACE = "myapp-eks-namespace"
        EKS_CLUSTER = "myapp-eks-cluster"
    }

    stages {
        // stage("Create an EKS Cluster") {
        //     steps {
        //         script {
        //             dir('terraform') {
        //                 sh "terraform init"
        //                 sh "terraform apply -auto-approve"
        //             }
        //         }
        //     }
        // }
        // stage("Deploy to EKS") {
        //     steps {
        //         script {
        //             dir('kubernetes') {
        //                 sh "aws eks update-kubeconfig --name myapp-eks-cluster"
        //                 sh "kubectl apply -f deployment.yaml"
        //                 sh "kubectl apply -f service.yaml"
        //             }
        //         }
        //     }
        // }
        stage("Destroy all resoures") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
        //--------------------------------------------/
        // stage('Login to ECR') {
        //     steps {
        //         echo 'check kubectl access'
        //         sh 'kubectl get svc'
        //         sh 'echo Logging in to Amazon ECR...'
        //         sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 167693783846.dkr.ecr.us-east-2.amazonaws.com'
        //     }
        // }



        
        // stage('Deploy to EKS') {
        //     steps {
        //         sh "aws eks update-kubeconfig --name myapp-eks-cluster --region us-east-2"

        //         sh "$KUBECTL_PATH config use-context $EKS_CLUSTER"
        //         sh "$KUBECTL_PATH config set-context $EKS_CLUSTER --namespace=$EKS_NAMESPACE"
        //         sh "docker build -t cicd-node-sample ."
        //         sh "docker tag cicd-node-sample:latest 167693783846.dkr.ecr.us-east-2.amazonaws.com/cicd-node-sample:latest"
        //         sh "docker push 167693783846.dkr.ecr.us-east-2.amazonaws.com/cicd-node-sample:latest"
        //     }
        // }
        //--------------------------------------------/



        //--------------------------------------------/
        // stage('Setup tools - kubernetes...') {
        //     steps {
        //     sh 'chmod +x ./prereqs.sh'
        //     sh './prereqs.sh'
        //     }
        // }

        // stage('Build and push image to ECR') {
        //     steps {
        //         script {
        //             docker.withRegistry(ECR_URL, 'ecr') {
        //                 def app = docker.build("${ECR_URL}:latest")
        //                 app.push()
        //             }
        //         }
        //     }
        // }
        //--------------------------------------------/
      
        
        //--------------------------------------------/
    }

    /**post {
        success {
            script {
                echo'Pushing the Docker image...'
                def app = docker.build("${ECR_URL}:latest")
                app.push()
                echo 'Push the latest image to cluster'
                // sh 'kubectl set image deployment/my-app my-app=${ECR_URL}/my-app:${env.BUILD_NUMBER}'
                // sh 'kubectl rollout status deployment/my-app'
                sh 'kubectl apply -f ./deployment.yaml'
                sh 'kubectl rollout restart -f ./deployment.yaml'
            }
        }
        
        failure {
            echo 'Build and deployment failed!'
        }
    }**/
    
}