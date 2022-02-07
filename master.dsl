// def jobs = ['git_example',
//             'git_pipeline_example',
//             'database_table_writeCSV_V20']

def dslDefinition(String test, Clousure clousure) {
    pipelineJob('git-example') {
        definition {
            cps {
                script(readFileFromWorkspace('git_example.seedjob'))
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

    clousure()
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
