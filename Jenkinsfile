#!groovy

pipeline {
  agent {
    label 'git-websites'
  }
  options {
    buildDiscarder logRotator(numToKeepStr: '5')
    timeout(40)
    disableConcurrentBuilds()
    skipStagesAfterUnstable()
  }
  environment {
    RUBY_PATH="${env.WORKSPACE}/.rvm"
    GEM_HOME="${RUBY_PATH}/gems"
    PATH="${GEM_HOME}/bin:${env.PATH}"
  }
  stages {
    stage('Build a staged website') {
      steps {
        sh """
          echo Generiting a new version of website        
   
          curl -sSL https://get.rvm.io | bash -s -- --path ${RUBY_PATH}
          mkdir -p ${GEM_HOME}
          bundle config set --local path ${GEM_HOME}
          gem install  --install-dir ${GEM_HOME} bundler -v '2.3.23'
          
          bundle install
          bundle exec jekyll build
        """
      }
    }
    stage('Deploy to stage area') {
      steps {
        sh """
          echo "Pushing changes into stage site"

          if ! git config remote.asf.url > /dev/null; then
            git remote add asf https://gitbox.apache.org/repos/asf/struts-site.git
          fi

          git fetch asf
          git checkout asf-staging
          git pull asf asf-staging

          cp -r _site/* content
          cp -r _site/.htaccess content/.htaccess

          git add content/*
          git add content/.htaccess
          git status

          git commit -m "Updates stage by Jenkins" --allow-empty
          git push asf asf-staging
        """
      }
    }
    stage('Comment on PR') {
      when {
        changeRequest()
      }
      steps {
        script {
          pullRequest.comment("Staged site is ready at https://struts.staged.apache.org/")
        }
      }
    }
  }
  post {
    // If this build failed, send an email to the list.
    failure {
      script {
        emailext(
            //to: "dev@struts.apache.org",
            recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            from: "Mr. Jenkins <jenkins@builds.apache.org>",
            subject: "Jenkins job ${env.JOB_NAME}#${env.BUILD_NUMBER} failed",
            body: """
There is a build failure in ${env.JOB_NAME}.

Build: ${env.BUILD_URL}
Logs: ${env.BUILD_URL}console
Changes: ${env.BUILD_URL}changes

--
Mr. Jenkins
Director of Continuous Integration
"""
        )
      }
    }

    // Send an email, if the last build was not successful and this one is.
    fixed {
      script {
        emailext(
            //to: "dev@struts.apache.org",
            recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            from: 'Mr. Jenkins <jenkins@builds.apache.org>',
            subject: "Jenkins job ${env.JOB_NAME}#${env.BUILD_NUMBER} back to normal",
            body: """
The build for ${env.JOB_NAME} completed successfully and is back to normal.

Build: ${env.BUILD_URL}
Logs: ${env.BUILD_URL}console
Changes: ${env.BUILD_URL}changes

--
Mr. Jenkins
Director of Continuous Integration
"""
        )
      }
    }
  }
}
