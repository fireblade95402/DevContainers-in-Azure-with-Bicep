param virtualNetworkGateways_dev_gw_name string = 'dev-gw'
param publicIPAddresses_dev_gw_pip_externalid string = '/subscriptions/461377a7-433d-4980-9506-c35defb10a49/resourceGroups/development/providers/Microsoft.Network/publicIPAddresses/dev-gw-pip'
param virtualNetworks_dev_vnet_externalid string = '/subscriptions/461377a7-433d-4980-9506-c35defb10a49/resourceGroups/development/providers/Microsoft.Network/virtualNetworks/dev-vnet'

resource virtualNetworkGateways_dev_gw_name_resource 'Microsoft.Network/virtualNetworkGateways@2020-11-01' = {
  name: virtualNetworkGateways_dev_gw_name
  location: 'uksouth'
  properties: {
    enablePrivateIpAddress: false
    ipConfigurations: [
      {
        name: 'vnetGatewayConfig0'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_dev_gw_pip_externalid
          }
          subnet: {
            id: '${virtualNetworks_dev_vnet_externalid}/subnets/GatewaySubnet'
          }
        }
      }
    ]
    sku: {
      name: 'Basic'
      tier: 'Basic'
    }
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    enableBgp: false
    activeActive: false
    vpnClientConfiguration: {
      vpnClientAddressPool: {
        addressPrefixes: [
          '172.16.24.0/24'
        ]
      }
      vpnClientProtocols: [
        'SSTP'
      ]
      vpnAuthenticationTypes: [
        'Certificate'
      ]
      vpnClientRootCertificates: [
        {
          name: 'p2sroot'
          properties: {
            publicCertData: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMzekNDQWNlZ0F3SUJBZ0lRSGdUK3FpL29wSmhCbnZtQ1ZjbTg5ekFOQmdrcWhraUc5dzBCQVFzRkFEQVMKTVJBd0RnWURWUVFEREFkUU1sTlNUMDlVTUI0WERUSXhNVEl5TWpBNE16TXhNMW9YRFRJeU1USXlNakE0TlRNeApNMW93RWpFUU1BNEdBMVVFQXd3SFVESlRVazlQVkRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDCkFRb0NnZ0VCQUwzWkNGdHFDcUF0dzJWRDRXcGN3Um9yMzZUM05mTTZSdXhYMll5akJrd0tXSXU4UHZQWTJjM28KOC9wWU1qR1lEaURPdVNDalRMdHlES25JcDduYWQycG9vUDhMR0NmQ3JXWVNDZWxJNzlzUXd0Wm9sM3NESkI3eQphZHh2QlpqbjlWTmFCS0NKK2d4elZjTmhLUkNSbXZjRmRtNEJ5ZmVVcG9XVHNnbnpIeWFhZUNnd3lNanY4eHlLCmRVN2g4RU9XbmR3TUdzZDJidEtSbzBuSjhRdDdRdytRR1BqY2RmdkxGdjJVV25ZYW0wL2F4Ykd5REZWTE1hWWUKbzNwbnNXQ253bW94YStWU3BsZTBIY0pqSUs5QmxaN3NiV3U0azdac3V0YTdwdEFlRFBVNEpQMkQyQ2preFhRUQpJbVcvbzNZekVqam9yREFiNHBXWXNoNkVKUjBKdmdrQ0F3RUFBYU14TUM4d0RnWURWUjBQQVFIL0JBUURBZ0lFCk1CMEdBMVVkRGdRV0JCVHFIV1gyQmR5N09UYUtKaWR1Q3VNMlBvN0dCekFOQmdrcWhraUc5dzBCQVFzRkFBT0MKQVFFQUVaUXZFaFp6YUJwNExzd1ZoVnQvRmhzSTAzdmRjcjU5VENVUURnVEYraEZiak41UEMzTURHN3RZQnJjdwpkZXFQaTRuR2pTV3ljRVk2RHZsNHhEcDF5UFZ2UlVPZmdEbVlYcktKS2V0YW5OeWhrSXczMHlWL0oybUxVVVZrClVyWWVnZHVtTmYxeHRoR2lISmxXYkZFVTBUaVFZVU8veEE4akU3NGRieWRZaFlYeTlKMkxyWWZmOThWUEYzbzQKTFVoaTNQL2taRkhNRDZaa2JNeGFqOEF2M2p3TUozdi9EbkZnTlpPSXMvL1lTa0x5bXN1N3hkaG1YcUxiYnoxbwpIUmVaN2t2Ny8zRFNpK0UxbnlXNjNLQy9RWGVyblpGenFVdStLTk5oL2M5WFBpOVZBa1NuRTVDc1Y2Q3pEd0p3Clo2V2gyeXpubWdXVmtOeTdZcFlrUUJnVVhnPT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo='
          }
        }
      ]
      vpnClientRevokedCertificates: []
      radiusServers: []
      vpnClientIpsecPolicies: []
    }
    bgpSettings: {
      asn: 65515
      bgpPeeringAddress: '10.1.255.30'
      peerWeight: 0
      bgpPeeringAddresses: [
        {
          ipconfigurationId: '${virtualNetworkGateways_dev_gw_name_resource.id}/ipConfigurations/vnetGatewayConfig0'
          customBgpIpAddresses: []
        }
      ]
    }
    vpnGatewayGeneration: 'Generation1'
  }
}