gitRepoUrls = ['https://github.com/jenkinsci/rest-list-parameter-plugin.git',
             'https://github.com/jenkinsci/git-parameter-plugin.git',
             'https://github.com/jenkinsci/warnings-ng-plugin.git']

job('git_pipeline_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    definition {
            cpsScm {
                scm {
                    git {
                        remote{
                            github('jenkinsci/pipeline-examples')
                        }
                    }
                }
                scriptPath('declarative-examples/simple-examples/environmentInStage.groovy')
            }
    }

}