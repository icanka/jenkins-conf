ArrayList<String> output = []
def runCommand = { strList ->
  assert ( strList instanceof String ||
           ( strList instanceof List && strList.each{ it instanceof String } ) \
)


  def process = new ProcessBuilder([ "sh", "-c", strList])
                                    .directory(new File("/tmp"))
                                    .redirectErrorStream(true) 
                                    .start()
  process.in.eachLine { line ->
   // println line
      output.push(line) }
  process.out.close()
  process.waitFor()

  print "[INFO] ( "
  if(strList instanceof List) {
    strList.each { print "${it} " }
  } else {
    print strList
  }
  println " )"

  if (process.exitValue()) {
    println "gave the following error: "
    println "[ERROR] ${process.getErrorStream()}"
  }
  assert !process.exitValue()
}

runCommand("git ls-remote --heads https://github.com/icanka/docker.git")
println output