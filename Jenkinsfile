#!groovy

pipeline {
  agent none
  options {
    buildDiscarder logRotator(numToKeepStr: '5')
    timeout(40)
    disableConcurrentBuilds()
    skipStagesAfterUnstable()
  }
  stages {
    stage('Build a staged websites') {
      agent {
        label 'git-websites'
      }
      steps {
        sh """
          echo Generiting a new version of website
          mkdir -p target/content

          export RUBY_PATH=${HOME}/.rvm
          export GEM_HOME=${RUBY_PATH}/gems

          curl -sSL https://get.rvm.io | bash -s -- --path ${RUBY_PATH}
          mkdir -p ${GEM_HOME}/gems
          gem install  --install-dir ${GEM_HOME} bundler -v '2.1.4'

          export PATH=${GEM_HOME}/bin:$PATH
          bundle install --path ${GEM_HOME}
          bundle
          bundle exec jekyll build
        """
        sh """
          echo "Pushing changes into stage site"

          if ! git config remote.asf.url > /dev/null; then
            git remote add asf https://gitbox.apache.org/repos/asf/struts-site.git
          fi

          git checkout asf-staging
          git pull asf asf-staging

          cp -r _site/* content
          cp -r _site/.htaccess content/.htaccess

          git add content/*
          git add content/.htaccess
          git status

          git commit -m "Updates stage by Jenkins" --allow-empty
          git push asf asf-staging
          git checkout master
        """
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
