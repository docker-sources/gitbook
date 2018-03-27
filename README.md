# Gitbook

<p align="center">
	<img alt="logo-docker" class="avatar rounded-2" height="150" src="https://avatars2.githubusercontent.com/u/35675959?s=400&u=b1f9ebca6fa8e5be55cb524e16f38b52f2f1dd58&v=4" width="160">
	<br>
	Travis-CI<br>
	<a href="https://travis-ci.org/docker-sources/gitbook">
		<img src="https://travis-ci.org/docker-sources/gitbook.svg?branch=master" alt="Build Status">
	</a>
</p>

Essa é uma imagem **docker** criada para permitir o uso do **gitbook** via container.

As palavras-chave "DEVE", "NÃO DEVE", "REQUER", "DEVERIA", "NÃO DEVERIA", "PODERIA", "NÃO PODERIA", "RECOMENDÁVEL", "PODE", e "OPCIONAL" presentes em qualquer parte deste repositório devem ser interpretadas como descritas no [RFC 2119](http://tools.ietf.org/html/rfc2119). Tradução livre [RFC 2119 pt-br](http://rfc.pt.webiwg.org/rfc2119).

## Imagens disponíveis

Consulte a guia [Tags](https://hub.docker.com/r/fabiojanio/gitbook/tags/) no repositório deste projeto no **Docker Hub** para ter acesso a outras versões.

## Pacotes presentes na imagem

 - gnupg
 - curl
 - wget
 - unzip
 - calibre
 - Nodejs
 - Arial fonts

## Considerações relevantes

 - Porta **4000** exposta
 - **WORKDIR** definido para /opt

## Start container

Execute essa instrução para montar um volume compartilhado entre *host* e *container*:

```
docker run --rm -v $(pwd)/livro/:/opt -p 4000:4000 fabiojanio/gitbook gitbook serve
```

**Obs**: no lugar de */livro* você DEVE informar o caminho a ser compartilhado com o container.

Métodos disponíveis: 
 - gitbook init
 - gitbook serve
 - gitbook epub
 - gitbook mobi
 - gitbook pdf

É possível compartilhar um diretório master e passar o caminho do seu livro como parâmetro:

```
docker run --rm -v $(pwd)/livros/:/opt -p 4000:4000 fabiojanio/gitbook gitbook serve caminho_do_arq
```

Opcionalmente você PODE abrir um terminal interativo:

```
docker run --rm -it -v $(pwd)/livro/:/opt -p 4000:4000 fabiojanio/gitbook /bin/bash
```

## Build (opcional)

Os passos anteriores estão configurados para utilizar a imagem já compilada disponível no **Docker Hub**, entretanto, caso queira compilar sua própria imagem customizada, basta efetuar o download do arquivo [**Dockerfile**](Dockerfile) e executar a instrução:

```
docker build -t nome_da_nova_imagem:nome_da_tag .
```

Posteriormente pode criar o container executando:

```
docker run --rm -v $(pwd)/livro/:/opt -p 4000:4000 nome_da_nova_imagem:nome_da_tag gitbook serve
```

**Obs**: o ponto no final indica que o path (caminho) será o workdir, no caso /opt (configurado no Dockerfile).

## Licença MIT

Para maiores informações, leia o arquivo de [licença](LICENSE) disponível neste repositório.