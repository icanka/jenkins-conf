import javaposse.jobdsl.dsl.ContextHelper
def jobs = ['git_example',
            'git_pipeline_example',
            'database_table_writeCSV_V20']

def dslDefinition(String test, Closure closure) {
    pipelineJob('git_example_SEEDJOB') {
        
        definition {
            println "##################"
            println this
            println owner
            println delegate
            println "####################"
            cps {
                script(readFileFromWorkspace('advent-jenkins-conf/git_example.seedjob'))
                sandbox()
            }


            //ContextHelper
            //closure()

        }

        println this
        println owner
        println delegate
        println "CLOSURE OWNER AND DELEGATE"
        println closure.owner
        println closure.delegate
        println "CLOSURE OWNER AND DELEGATE AGAIN"
        closure.owner = owner
        closure.delegate = delegate
        println closure.owner
        println closure.delegate

        ContextHelper.executeInContext(closure, delegate)
    }
}


dslDefinition("test string"){
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

for (jobName in jobs){
    fileName = jobName + ".seedjob"
    jobName += "_SEEDJOB"

    pipelineJob(jobName) {
        definition {
            cps {
                script(readFileFromWorkspace('advent-jenkins-conf/' + fileName))
                //sandbox()
            }
        }

    }

}

pipelineJob('git-example') {
    definition {
        cps {
            script(readFileFromWorkspace('advent-jenkins-conf/test.jenkinsfile'))
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
