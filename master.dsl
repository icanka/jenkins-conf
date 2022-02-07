// def jobs = ['git_example',
//             'git_pipeline_example',
//             'database_table_writeCSV_V20']

def dslDefinition(String test, Closure closure) {
    pipelineJob('git_example_SEEDJOB') {
        definition {
            cps {
                script(readFileFromWorkspace('git_example.seedjob'))
                sandbox()
            }
        }

        println "######################################################################################################"
        println this
        println owner
        println delegate
        // parameters {
        //     activeChoiceParam('CHOICE-1') {
        //         description('Allows user choose from multiple choices')
        //         filterable()
        //         choiceType('SINGLE_SELECT')
        //         groovyScript {
        //             script('["choice1", "choice2"]')
        //             fallbackScript('"fallback choice"')
        //         }
        //     }
        // }
        println "######################################################################################################"
        println this
        println "CLOSURE OWNER AND DELEGATE"
        println closure.owner
        println closure.delegate
        println "CLOSURE OWNER AND DELEGATE AGAIN"
        closure.owner = owner
        closure.delegate = delegate
        println closure.owner
        println closure.delegate
        //closure()
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

// for (jobName in jobs){
//     fileName = jobName + ".seedjob"
//     jobName += "_SEEDJOB"

//     pipelineJob(jobName) {
//         definition {
//             cps {
//                 script(readFileFromWorkspace(fileName))
//                 //sandbox()
//             }
//         }

//     }

// }

// pipelineJob('git-example') {
//     definition {
//         cps {
//             script(readFileFromWorkspace('test.jenkinsfile'))
//             sandbox()
//         }
//     }

//     parameters {
//         activeChoiceParam('CHOICE-1') {
//             description('Allows user choose from multiple choices')
//             filterable()
//             choiceType('SINGLE_SELECT')
//             groovyScript {
//                 script('["choice1", "choice2"]')
//                 fallbackScript('"fallback choice"')
//             }
//         }
//     }
// }
