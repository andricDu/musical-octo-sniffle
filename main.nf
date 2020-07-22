#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {
  pod secret: workflow.runName, mountPath: '/tmp/access'

  echo true
  input: 
    val x from cheers
  script:
    """
    echo '$workflow.runName'
    echo '$x world!'
    ls -l /tmp/access
    cat /tmp/access/apikey
    sleep 120
    """
}
