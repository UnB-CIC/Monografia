# UnB-CIC #

Modelo padrão de formatação de documentos acadêmicos do [Departamento de Ciência da Computação](https://www.cic.unb.br) da [Universidade de Brasília](https://www.unb.br). Este modelo existe para **padronizar** a formatação dos documentos, portanto **evite** modificar a classe ou usar configurações/pacotes diferentes dos definidos.


## Licença ##

Esta obra está licenciado com uma Licença [Creative Commons Atribuição-CompartilhaIgual 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/deed.pt_BR).

![Licença Creative Commons](img/cc.png?raw=true )


## Instalação ##

Assume-se que há uma instalação correta do [TeX Live](https://www.tug.org/texlive/). Para qualquer dos sistemas operacionais mais comuns (Unix/Mac OS/Windows), basta copiar todos os arquivos disponíveis. A forma mais simples de fazer isso é baixar o arquivo [ZIP](https://github.com/UnB-CIC/Monografia/archive/master.zip) e descompactá-lo em sua área de trabalho.


## Uso ##

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

O mesmo resultado pode ser obtido usando uma interface gráfica mais amigável, como o [TeXWorks](http://www.tug.org/texworks/), mas geralmente é preciso gerar o glossário separadamente.


### MiKTeX ###

Utilizando a instalação básica da versão 2.9.5105 (Windows XP 32-bit) do [MiKTeX](http://miktex.org/), ao abrir o arquivo ```monografia.tex``` com o editor instalado (TeXWorks), e executando a opção padrão oferecida ```pdfLaTeX+MakeIndex+BibTeX```, o programa indicou a ausência de diversos pacotes; mas já oferecendo a opção de instalação destes. O pacote _glossaries_ depende de _tracklang.sty_, que foi instalado pelo gerenciador de pacotes do próprio MiKTeX (após sincronização). Para gerar o glossário, é preciso instalar PERL e realizar alguns ajustes, há instruções muito claras [neste link](http://latex-community.org/know-how/latex/55-latex-general/263-glossaries-nomenclature-lists-of-symbols-and-acronyms#makeglossaries). Com a versão [ActiverPerl](http://www.activestate.com/activeperl)) 5.20.2 Build 2001, a configurando a opção _makeglossaries_ conforme as instruções, o PDF foi gerado sem problemas.


## Resolução de Problemas ##

**Não há suporte ativo para este projeto**.


A versão disponível aqui apresenta um exemplo completo de texto usando a classe e funciona em um sistema adequadamente configurado. Tem alguma sugestão para melhorar a classe? Ótimo, [contribuições](http://imasters.com.br/desenvolvimento/como-contribuir-com-um-projeto-no-github) são sempre bem vindas!


### Não consigo gerar o texto! ###

Uma solução popular ultimamente tem sido usar uma ferramenta online como o [ShareLaTeX](http://pt.sharelatex.com).

Caso queira usar o seu próprio sistema, veja cuidadosamente as seções de instalação e uso acima. Se a sua configuração está conforme e ainda assim não funciona, geralmente há algum tipo de mensagem descrevendo o problema; tente buscar soluções no [Google](https://www.google.com) ou em sítios especializados como o [StackExchange](http://tex.stackexchange.com).

Se isso não funcionar, pode tentar gerar um [novo _issue_](https://github.com/UnB-CIC/Monografia/issues/new) no projeto, que **será analisado quando possível**. Providencie informações para a análise/investigação (veja [isso](http://wiki.python.org.br/ComoFazerPerguntasInteligentes) e esses [aqui](http://meta.tex.stackexchange.com/questions/228/ive-just-been-asked-to-write-a-minimal-example-what-is-that) e [ali](http://meta.tex.stackexchange.com/a/3301)).


### Os autores são listados incorretamente nas referências! ###

O pacote [babel](https://ctan.org/pkg/babel) não reconhece a conjunção aditiva **e** entre os autores listados no arquivo ```.bib```, é preciso usar a palavra __and__ para que a formatação seja adequada.

### Queria fazer _XXX_ e não sei como! ###

Este modelo existe para **padronizar** a formatação dos documentos, portanto **evite** modificar a classe ou usar configurações/pacotes diferentes dos definidos. Claro, há _raras_ circunstâncias em que algo um pouco diferente se faz necessário, nesses casos a documentação e sítios especializados são seus principais aliados.

  * [Procure na internet](http://bfy.tw/9AHK)
  * [**LaTeX Wikibook**](https://en.wikibooks.org/wiki/LaTeX/)
  * [StackExchange](http://tex.stackexchange.com)
  * [LaTeX Community](http://www.latex-community.org)
