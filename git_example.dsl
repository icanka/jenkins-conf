gitRepoUrls = ['https://github.com/jenkinsci/rest-list-parameter-plugin.git',
             'https://github.com/jenkinsci/git-parameter-plugin.git',
             'https://github.com/jenkinsci/warnings-ng-plugin.git']

job('git_example') {
    // definition {
    //     cps {
    //         script(readFileFromWorkspace('git_example.jenkinsfile'))
    //         sandbox()
    //     }
    // }

    scm {
        git {
            for (repoUrl in gitRepoUrls) {
                remote {
                    String repoName = repoUrl.split('/').last().replaceAll('.git', '')
                    name("${repoName}")
                    url("${repoUrl}")
                }
            }
        }
    }
    parameters {
        for (repoUrl in gitRepoUrls) {
            String repoName = repoUrl.split('/').last().replaceAll('.git', '')
            gitParameter {
                type('PT_TAG')
                name("${repoName}")
                description('')
                branch('')
                useRepository("${repoName}")
                defaultValue('')
                branchFilter('')
                tagFilter('')
                sortMode('DESCENDING_SMART')
                selectedValue('NONE')
                quickFilterEnabled(false)
                listSize('0')
            }
        }

    }
}
