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
                name('git-parameter-plugin')
                url('https://github.com/jenkinsci/git-parameter-plugin.git')
            }
            remote{
                name('warnings-ng-plugin')
                url('https://github.com/jenkinsci/warnings-ng-plugin.git')
            }
            
        }
    }
    parameters {
        gitParameter{
            type('PT_TAG')
            name('git-parameter-plugin')
            description('tags')
            branch('')
            useRepository('git-parameter-plugin')
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