#!/usr/bin/env nextflow
nextflow.preview.dsl=2

process sayHello {
  pod secret: workflow.runName + '-secret', mountPath: '/tmp/' + workflow.runName

  echo true
  input: 
    val x
  script:
    """
    echo '$workflow.runName'
    echo '$x world!'
    ls -ls /tmp/$workflow.runName
    """
}


workflow {
  cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'
  sayHello(cheers)
}
