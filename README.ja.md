# debug-container

`debug-container` は Kubernetes クラスター内の Pod をデバッグするために使用されるコンテナイメージです。

## kubectl debug の使用例

以下に、`kubectl debug` コマンドの異なる使用例とその説明を示します。

### 基本的なデバッグ

最も基本的なデバッグ操作で、元のPodにデバッグコンテナを追加しますが、プロセス名前空間の共有は行いません。

```bash
kubectl debug {{TARGET_POD}} -it --image=ogontaro/debug-container -- /bin/bash
```

### 元の Pod にデバッグコンテナを追加

元のPodに直接デバッグ用コンテナを追加し、プロセス名前空間を共有する場合に使用します。これにより、元のPodのプロセスやリソースに直接アクセスできます。

```bash
kubectl debug {{TARGET_POD}} -it --image=ogontaro/debug-container --share-processes -- /bin/bash
```

### Pod の複製を作成してデバッグ

このコマンドは、元のPodを複製して新しいPod (`debug-container`) を作成し、そこでデバッグを行います。これにより、元のPodの動作に影響を与えずにデバッグが可能です。

```bash
kubectl debug {{TARGET_POD}} -it --image=ogontaro/debug-container --share-processes --copy-to=debug-container -- /bin/bash
```
