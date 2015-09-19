# UnB-CIC

Modelo padrão de formatação de documentos acadêmicos do [Departamento de Ciência da Computação](www.cic.unb.br) da [Universidade de Brasília](www.unb.br). Este modelo existe para __padronizar__ a formatação dos documentos, portanto **evite** modificar a classe ou usar configurações/pacotes diferentes dos definidos.

## Instalação

Assume-se que há uma instalação correta do [TeX Live](https://www.tug.org/texlive/). Para qualquer dos sistemas operacionais mais comuns (Unix/Mac OS/Windows), basta copiar todos os arquivos disponíveis. A forma mais simples de fazer isso é baixar o arquivo [ZIP](https://github.com/UnB-CIC/Monografia/archive/master.zip) e descompactá-lo em sua área de trabalho.

## Uso

A criação de um arquivo PDF é simples, basta processar o arquivo principal (`monografia.tex`) com o programa `pdflatex`. Isso pode ser feito pela linha de comando:

```bash
cd /caminho/para/arquivos/
pdflatex monografia
```

Para gerar as referências bibliográficas, utiliza-se a ferramenta [`bibtex`](http://www.bibtex.org/):

```bash
bibtex monografia
```

E para gerar as referências de siglas/abreviaturas, a ferramenta [`makeglossaries`](https://www.ctan.org/pkg/glossaries):

```bash
makeglossaries monografia
```

Para finalizar, é preciso processar tudo novamente:

```bash
pdflatex monografia
```

O mesmo resultado pode ser obtido usando uma interface gráfica mais amigável, como o [TeXworks](http://www.tug.org/texworks/), mas geralmente é preciso gerar o glossário separadamente.

### MiKTeX

Utilizando a instalação básica da versão 2.9.5105 (Windows XP 32-bit) do [MiKTeX](http://miktex.org/), ao abrir o arquivo ```monografia.tex``` com o editor instalado (TeXworks), e executando a opção padrão oferecida ```pdfLaTeX+MakeIndex+BibTeX```, o programa indicou a ausência de diversos pacotes; mas já oferecendo a opção de instalação destes. O pacote _glossaries_ depende de _tracklang.sty_, que foi instalado pelo gerenciador de pacotes do próprio MiKTeX (após sincronização). Para gerar o glossário, é preciso instalar PERL e realizar alguns ajustes, há instruções muito claras [neste link](http://latex-community.org/know-how/latex/55-latex-general/263-glossaries-nomenclature-lists-of-symbols-and-acronyms#makeglossaries). Com a versão [ActiverPerl](http://www.activestate.com/activeperl) 5.20.2 Build 2001, a configurando a opção _makeglossaries_ conforme as instruções, o PDF foi gerado sem problemas.
