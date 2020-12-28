job('git_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    scm{
        gitScm{
            userRemoteConfigs{
                userRemoteConfig{
                    url('https://github.com/jenkinsci/git-parameter-plugin.git')
                    name('first')
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