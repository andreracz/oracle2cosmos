@description('Server Name. (will be used as the DNS Label)')
param serverName string=''
@description('CPUs for the server')
param numberCpuCores int = 1

@description('Memory available to the server.')
param memory int = 4

@description('SYS Password')
@secure()
param passwd string = ''

@description('Sample rows to insert into sales')
param rows int = 1000

var location = resourceGroup().location




resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2019-12-01' = {
  name: serverName
  location: location
  properties: {
    containers: [
      {
        name: serverName
        properties: {
          image: 'container-registry.oracle.com/database/express:21.3.0-xe'
          environmentVariables: [
            {
                name: 'ORACLE_PWD'
                secureValue: passwd
            }            
          ]
          resources: {
            requests: {
              cpu: numberCpuCores
              memoryInGB: memory
            }
          }
          ports: [
            {
              port: 1521
              protocol: 'TCP'
            }
          ]
         volumeMounts: [
            {
              name: 'scriptsshare'
              mountPath: '/opt/oracle/scripts/startup'
              readOnly: false
            }
          ] 
        }
      }
    ]
    osType: 'Linux'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          protocol: 'TCP'
          port: 1521
        }
      ]
      dnsNameLabel: serverName
    }
    restartPolicy: 'Never'
   volumes: [
      {
        name: 'scriptsshare'
        secret: {
          '0_database.sql': base64(loadTextContent('../scripts/0_database.sql'))
          '1_data.sql': base64('ALTER SESSION set container = XEPDB1;\nexec sales.random_sales(${rows});')
        }
      }
    ]
  }
}
