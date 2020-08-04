#!/usr/bin/env nextflow
nextflow.preview.dsl=2

process sayHello {
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
