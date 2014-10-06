# UnB-CIC

## Instalação

Assume-se que há uma instalação correta do [TeX Live](https://www.tug.org/texlive/). 
Para qualquer dos sistemas operacionais mais comuns (Unix/Mac OS/Windows), basta 
copiar todos os arquivos disponíveis. A forma mais simples de fazer isso é baixar 
o arquivo [ZIP](https://github.com/UnB-CIC/Monografia/archive/master.zip) e 
descompactá-lo em sua área de trabalho.

## Uso

A criação de um arquivo PDF é simples, basta processar o arquivo principal 
(`monografia.tex`) com o programa `pdflatex`. Isso pode ser feito pela linha de 
comando:

    cd /caminho/para/arquivos/
    pdflatex monografia

Para gerar as referências bibliográficas, utiliza-se a ferramenta [`bibtex`](http://www.bibtex.org/),
sendo necessários mais dois passos subsequentes:

    bibtex monografia
    pdflatex monografia

O mesmo resultado pode ser obtido usando uma interface gráfica mais amigável, 
como o [TeXworks](http://www.tug.org/texworks/). Neste caso, bastaria abrir o 
arquivo principal com o editor e executar a compilação.

## Observações

Usuários do [MiKTeX](http://miktex.org/) geralmente reclamam de erro relacionado 
a ausência do pacote [hypernat](http://mirrors.ctan.org/macros/latex/contrib/hypernat/hypernat.sty)
devido ao uso do pacote [natbib](http://www.ctan.org/tex-archive/macros/latex/contrib/natbib). 
Isto pode ser facilmente remediado acrescentando-o ao diretório onde está o arquivo
principal.