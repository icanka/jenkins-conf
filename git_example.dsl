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
                name('first')
                url('https://github.com/jenkinsci/git-parameter-plugin.git')
            }
            
        }
    }

    parameters {
        gitParameter{
            name('git-parameter-plugin')
            description('tags')
            type('TAG')
            branch('master')
            useRepository('first')
            defaultValue('')
            branchFilter('')
            tagFilter('')
            sortMode('DESCENDING_SMART')
            selectedValue('NONE')
            quickFilterEnabled('')
        }

    }
}