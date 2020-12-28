job('git_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    parameters {
        gitParam('TAG') {
            description('tags')
            type('TAG')
            branch('master')
        }

    }
}