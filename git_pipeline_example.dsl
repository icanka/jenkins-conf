gitRepoUrls = ['https://github.com/jenkinsci/rest-list-parameter-plugin.git',
             'https://github.com/jenkinsci/git-parameter-plugin.git',
             'https://github.com/jenkinsci/warnings-ng-plugin.git']

pipelineJob('git_pipeline_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    definition {
            cps {
                script(readFileFromWorkspace('git_pipeline_example.jenkinsfile')) 
        }
    }


    parameters {

        for (repoUrl in gitRepoUrls){
            String repoName = repoUrl.split('/').last().replaceAll('.git', '')

            activeChoiceReactiveParam(repoName+"_TAG") {
                description('Tags for ' + repoName)
                filterable()
                choiceType('SINGLE_SELECT')
                groovyScript {
                    script("""
                    String gitCommand = "git ls-remote -t " + "${repoUrl}"
                    def getTags = gitCommand.execute()
                    def tagsRaw = []
                    def tags = []
                    getTags.text.eachLine {tagsRaw.add(it)}

                    for(i in tagsRaw)
                    {
                    def tagName=i.split()[1].replaceAll('\\\\^\\\\{\\\\}', '').replaceAll('refs/tags/', '')
                        tags.add(tagName)
                    }
                    return tags
                    """)
                    fallbackScript('"fallback choice"')
                }
            }

            activeChoiceReactiveParam(repoName+"BRANCH") {
                description('Branches for ' + repoName)
                filterable()
                choiceType('SINGLE_SELECT')
                groovyScript {
                    script("""
                    def getBranches = "git ls-remote --heads "${repoUrl}".execute()

                    def branches_raw = []
                    def branchNames = []
                    getBranches.text.eachLine {branches_raw.add(it)}

                    for(i in branches_raw)
                    {
                    def tagName=i.split()[1].replaceAll('refs/heads/', '')
                        branchNames.add(tagName)
                    }
                    return branchNames
                    """)
                    fallbackScript('"fallback choice"')
                }
            }
        }

        


    }

}