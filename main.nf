#!/usr/bin/env nextflow
nextflow.preview.dsl=2

include songGetAnalysis as songGet from './modules/song_get_analysis'


process sayHello {
  pod secret: params.rdpc_secret_name, mountPath: '/tmp/rdpc_secret'

  echo true
  input: 
    val x

  shell:
    '''
    echo '!{workflow.runName}'
    echo '!{x} world!'
    ls -ls /tmp/rdpc_secret
    export FOO=`cat /tmp/rdpc_secret/secret`
    export BAR='lalala'
    echo $BAR
    echo $FOO
    '''
}


workflow {
  cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'
  //songGet('PACA-CA', '95f8ec71-aa8b-48fc-b971-a3aafc048a33')
  sayHello(cheers)
}
