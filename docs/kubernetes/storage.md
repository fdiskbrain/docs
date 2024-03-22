# Volumes

## Persistent volumes
- Volume type
  - Static
  - Dynamic
- Lifecycle
  - Binding
  - Using
  - Relaiming
  - Retain
  - Delete
  - Recycle
## Projected volumes
- Secret
- Downwardapi
- Configmap
- ServiceAccountToken

## Ephemeral volumes

- Tempdir
- Configmap
- Downwardapi

```mermaid
    graph TD 
    A1(PersistentVolume)
    A2(PersistentVolumeClaim)
    A3((StorageClass))
    A4(SnapShot)
    A5((SnapShotClass))
    A6(ProjectedVolumes)
    A7(Volumes)
    B61(Secret)
    B62(DownwardAPI)
    B63(Configmap)
    B64(ServiceAccountToken)
    
    subgraph kubenetes csi resource
        A1
        A2
        A3
        A4
        A5
        A6
    end
    subgraph ProjectedVolumes
        A6-->B61
        A6-->B62
        A6-->B63
        A6-->B64
    end
```
