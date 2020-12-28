pipelineJob('git-example') {
    definition {
        cps {
            script(readFileFromWorkspace('git-example.jenkinsfile'))
            sandbox()
        }
    }

    parameters {
        activeChoiceParam('CHOICE-1') {
            description('Allows user choose from multiple choices')
            filterable()
            choiceType('SINGLE_SELECT')
            groovyScript {
                script('["choice1", "choice2"]')
                fallbackScript('"fallback choice"')
            }
        }
    }
}