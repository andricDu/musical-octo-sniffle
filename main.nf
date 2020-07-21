#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {
  
  pod = [secret: workflow.runName, mountPath: '/tmp/file.txt']

  echo true
  input: 
    val x from cheers
  script:
    """
    echo '$workflow.runName'
    echo '$x world!'
    """
}
