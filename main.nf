#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {
  pod secret: workflow.runName + '-secret', mountPath: '/tmp/argo'

  echo true
  input: 
    val x from cheers
    env y from path('/tmp/argo/secret')
  script:
    """
    echo '$workflow.runName'
    echo '$x world!'
    ls -l /tmp/argo
    cat /tmp/argo/secret
    """
}
