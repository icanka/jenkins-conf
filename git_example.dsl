job('git_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    scm{
        git{
            remote{
                name('first')
                url('https://github.com/jenkinsci/git-parameter-plugin.git')
            }
            
        }
    }

    parameters {
        gitParameter('TAG') {
            name('first')
            description('tags')
            type('TAG')
            branch('master')
        }

    }
}