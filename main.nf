#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process sayHello {
  pod secret: workflow.runName + '-secret', mountPath: '/tmp/argo'

  echo true
  input: 
    val x
  script:
    """
    echo '$workflow.runName'
    echo '$x world!'
    """
}


workflow {
  cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'
  sayHello(cheers)
}
