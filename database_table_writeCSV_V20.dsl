pipelineJob('database_table_writeCSV_V20') {
   
    definition {
            cps {
                script(readFileFromWorkspace('database_table_writeCSV_V20.jenkinsfile'))
            }
    }


    parameters {

            activeChoiceParam('TABLE_NAME') {
                description('Employee database tables')
                filterable()
                choiceType('SINGLE_SELECT')
                groovyScript {
                    script('''
                    import groovy.sql.Sql
                    def output = []
                    Class.forName("com.mysql.jdbc.Driver")
                    def sql = Sql.newInstance("jdbc:mysql://db_host:3306/employees", "root", "1234", "com.mysql.jdbc.Driver")
                    sql.eachRow("SHOW TABLES"){row ->
                        output.push(row.tables_in_employees)
                    }
                    sql.close()
                    return output
                    ''')
                    fallbackScript('"fallback choice"')
                }
            }
    }

}