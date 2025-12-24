param staticSites_insure_name string = 'insure-test-iac'

resource staticSites_insure_name_resource 'Microsoft.Web/staticSites@2024-11-01' = {
  name: staticSites_insure_name
  location: 'West Europe'
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    repositoryUrl: 'https://github.com/nenord/insure-frontend'
    branch: 'main'
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}

resource staticSites_insure_name_default 'Microsoft.Web/staticSites/basicAuth@2024-11-01' = {
  parent: staticSites_insure_name_resource
  name: 'default'
  location: 'West Europe'
  properties: {
    applicableEnvironmentsMode: 'SpecifiedEnvironments'
  }
}
