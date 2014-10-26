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
sendo necessários mais três passos subsequentes:

    bibtex monografia
    pdflatex monografia
    pdflatex monografia

O mesmo resultado pode ser obtido usando uma interface gráfica mais amigável, 
como o [TeXworks](http://www.tug.org/texworks/). Neste caso, bastaria abrir o 
arquivo principal com o editor e executar a compilação.

### MiKTeX

Utilizando a instalação básica da versão 2.9.5105 (Windows XP 32-bit) do [MiKTeX](http://miktex.org/), ao abrir o arquivo ```monografia.tex``` com o editor instalado (TeXworks), e executando a opção padrão oferecida ```pdfLaTeX+MakeIndex+BibTeX```, o programa indicou a ausência dos seguintes pacotes: _xcolor_, _url_, _boites_, _setspace_, _pdfpages_, _eso-pic_, _supp-pdf_, e _arial_; mas já oferecendo a opção de instalação. Após instalar, o PDF foi gerado sem problemas.

## Observações

Por conta das possivéis configurações de bibliografia, alguns usuários *erroneamente* utilizam o pacote [natbib](http://www.ctan.org/tex-archive/macros/latex/contrib/natbib), geralmente levando a erro relacionado a ausência do pacote [hypernat](http://mirrors.ctan.org/macros/latex/contrib/hypernat/hypernat.sty).  Isto pode ser facilmente remediado acrescentando-o ao diretório onde está o arquivo principal.
