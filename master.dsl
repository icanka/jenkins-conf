def jobs = ['git-example']

for (jobName in jobs){
    fileName = jobName + ".seedjob"
    jobName += "_SEEDJOB"

    pipelineJob(jobName) {
        definition {
            cps {
                script(readFileFromWorkspace(fileName))
                //sandbox()
            }
        }

    }

}

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
