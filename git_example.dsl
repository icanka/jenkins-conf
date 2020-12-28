job('git_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    scm{
        gitSCM{
            userRemoteConfigs{
                userRemoteConfig{
                    url('https://github.com/jenkinsci/git-parameter-plugin.git')
                    name('first')
                    refspec('')
                    credentialsId('')

                }
            }
        }
    }

    parameters {
        gitParam('TAG') {
            description('tags')
            type('TAG')
            branch('master')
        }

    }
}