#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {
  
  label: 'secret_test'

  echo true
  input: 
    val x from cheers
  script:
    """
    echo '$workflow.runName'
    echo '$x world!'
    """
}
