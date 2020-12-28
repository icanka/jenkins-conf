pipelineJob('git-example') {
    definition {
        cps {
            script(readFileFromWorkspace('git-example.jenkinsfile'))
            sandbox()
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