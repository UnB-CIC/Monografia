% -*- mode: LaTeX; coding: utf-8; -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File    : unb-cic.cls (LaTeX2e class file)
%% Authors : Flávio Maico Vaz da Costa
%%              (based on previous versions by José Carlos L. Ralha)
%% Version : 0.95
%% Updates : 0.5  [??/11/2004] - Initial release. don't remember the day.
%%         : 0.75 [04/04/2005] - Fixed font problems, UnB logo
%%                               resolution, keywords and palavras-chave
%%                               hyphenation and generation problems,
%%                               and a few other problems.
%%         : 0.8  [08/01/2006] - Corrigido o problema causado por
%%                               bancas com quatro membros. O quarto
%%                               membro agora é OPCIONAL.
%%                               Foi criado um novo comando chamado
%%                               bibliografia. Esse comando tem dois
%%                               argumentos onde o primeiro especifica
%%                               o nome do arquivo de referencias
%%                               bibliograficas e o segundo argumento
%%                               especifica o formato. Como efeito
%%                               colateral, as referências aparecem no
%%                               sumário.
%%         : 0.9 [02/03/2008]  - Reformulação total, com nova estrutura
%%                               de opções, comandos e ambientes, adequação
%%                               do logo da UnB às normas da universidade,
%%                               inúmeras melhorias tipográficas,
%%                               aprimoramento da integração com hyperref,
%%                               melhor tratamento de erros nos comandos,
%%                               documentação e limpeza do código da classe.
%%         : 0.91 [10/05/2008] - Suporte ao XeLaTeX, aprimorado suporte para
%%                               glossaries.sty, novos comandos \capa, \CDU
%%                               e \subtitle, ajustes de margem para opções
%%                               hyperref/impressao.
%%         : 0.92 [26/05/2008] - Melhora do ambiente {definition}, suporte
%%                               a hypcap, novos comandos \fontelogo e
%%                               \slashedzero, suporte [10pt, 11pt, 12pt].
%%                               Corrigido bug de seções de apêndice quando
%%                               usando \hypersetup{bookmarksnumbered=true}.
%%         : 0.93 [09/06/2008] - Correção na contagem de páginas, valores
%%                               load e config para opção hyperref, comandos
%%                               \ifhyperref e \SetTableFigures, melhor
%%                               formatação do quadrado CIP. 
%%         : 0.94 [17/04/2014] - Inclusão da opção mpca. 
%%         : 0.95 [06/06/2014] - Remoção da opção "mpca", inclusão das opções
%%                               "doutorado", "ppginf", e "ppca" para identificar
%%                               o programa de pós-graduação. Troca do teste 
%%                               @mestrado por @posgraduacao.
%%         : 0.96 [24/06/2014] - Ajuste do nome do curso/nome do programa.
%%
%% Definição de classe para dissertações do departamento de
%% Ciência da Computação (CIC) da Universidade de Brasília.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PRÉ-REQUISITOS (usando LaTeX ou XeLaTeX):
%%
%% * Uma distribuição LaTeX2e compatível
%%   - em Windows, recomenda-se MiKTeX: http://miktex.org/
%% * Logomarca da UnB (arquivos positivo_cor.eps e contorno_preto.eps)
%%   - disponível na página: http://www.unb.br/unb/marca/index.php
%% * Pacotes obrigatórios
%%   - xkeyval, graphicx, boites, setspace,
%%     geometry, atbegshi, hyperref
%%
%% PRÉ-REQUISITOS (usando XeLaTeX):
%% * Fonte "Arial" instalada no sistema operacional
%% * Pacotes obrigatórios
%%   - fontspec, xltxtra (carregar no próprio documento)
%%
%% PRÉ-REQUISITOS (usando LaTeX):
%% * Fonte ua1 (URW Arial A030, PostScript Type-1)
%%   - disponível no CTAN: http://www.ctan.org/tex-archive/fonts/urw/arial/
%%   - no MiKTeX, basta instalar pacote "arial" via MiKTeX Package Manager
%% * Pacotes obrigatórios
%%   - relsize, fixltx2e
%% * Pacotes opcionais
%%   - MinionPro (fonte proprietária)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PRINCIPAIS OPÇÕES DISPONÍVEIS:
%%
%% licenciatura - O trabalho é do curso de Licenciatura (Graduação).
%% bacharelado  - O trabalho é do curso de Bacharelado (Graduação).
%% mestrado     - O trabalho é de Mestrado.
%% doutorado    - O trabalho é de Doutorado.
%% ppginf       - O trabalho é do programa de Pós-graduação em Informática.
%% ppca         - O trabalho é do programa de Pós-graduação em Computação Aplicada.
%%
%% draft - Gera o documento em modo de rascunho: não exibe as imagens e
%%         modifica o espaçamento entre linhas.
%% final - Gera o documento em modo final, não-rascunho (padrão).
%%
%% impressao       - Gera a versão para impressão, sem hipertexto.
%% hyperref=load   - Carrega e configura o pacote hyperref para gerar
%%                   a versão hipertexto para exibição em tela (padrão).
%% hyperref=config - Configura o pacote hyperref para gerar
%%                   a versão hipertexto para exibição em tela, mas o
%%                   pacote deve ser carregado no próprio documento.
%%                   Leia a seção PROBLEMAS CONHECIDOS para recomendação
%%                   de uso desta opção.
%%
%% 10pt - Define tamanho da fonte do texto.
%% 11pt - Define tamanho da fonte do texto (padrão no modo draft).
%% 12pt - Define tamanho da fonte do texto (padrão no modo final).
%%
%% singlespacing  - Define espaçamento simples entre linhas (padrão no modo
%%                  final).
%% onehalfspacing - Define espaçamento de um e meio entre linhas (padrão no
%%                  modo draft).
%% doublespacing  - Define espaçamento duplo entre linhas.
%% baselineskip   - Utiliza o comando \baselineskip para definir o espaçamento
%%                  de linhas. Se não for infomada, o espaçamento é definido 
%%                  pelo pacote "setspace" (recomendável, ou seja, só use esta
%%                  opção se tiver algum motivo para não usar o setspace).
%%                  Pode ser usada em conjunto com uma das três opções acima.
%%
%% prestyle=<val>  - Especifica o estilo das páginas iniciais (agradecimentos,
%%                   resumo, sumário, etc.). Valores típicos são "plain"
%%                   (padrão) ou "empty".
%% textstyle=<val> - Especifica o estilo das páginas dos elementos textuais e
%%                   pós-textuais. Valores típicos são "plain" (padrão) ou
%%                   "fancy" (este último requer o pacote {fancyhdr}).
%% chapstyle=<val> - Especifica o estilo da primeira página de cada capítulo.
%%                   Valores típicos são "plain" (padrão) ou "empty".
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CRIAÇÃO DA MONOGRAFIA:
%%
%% A folha de rosto e folha de aprovação, por padronização estética,
%% são sempre formatados como "onehalfspacing" independente das opções
%% escolhidas. A seção de Referências é sempre "singlespacing". Citações
%% {quote}, {quotation} e versos {verse} são automaticamente "singlespacing" e
%% com letra menor.
%%
%% Os comandos \textlinf (lining figures) e \texttabf (tabular figures)
%% permitem selecionar, respectivamente, números "maiúsculos" (sim, isso
%% existe!) e números monoespaçados - o que só faz sentido para fontes 
%% que conhenham números maiúsculos x minúsculos e monoespaçados x
%% proporcionais (Minion Pro, Myriad Pro, Didot, Apple Chancery...).
%% Essas opção foi implementada apenas para a fonte Adobe Minion Pro no LaTeX,
%% mas funciona para qualquer fonte que suporte este recurso no XeLaTeX -
%% veja a documentação do pacote {fontspec} para mais informações.
%% Use \textlinf quando os números acompanharem texto em letras maiúsculas ou
%% em versalete (small-caps). Use \texttabf em tabelas ou outros lugares onde
%% for desejável que os números fiquem alinhados em colunas. Como alternativa
%% aos comandos, pode-se usar os ambientes {linfig} e {tabfig}.
%% O comando \SetTableFigures pode ser usado para redefinir um ambiente de
%% modo que os números contidos nele sejam automaticamente formatados
%% maiúsculos e monoespaçados, por exemplo: 
%%
%%   \SetTableFigures{tabular}
%%   \SetTableFigures{tabularx}
%%   \SetTableFigures{longtable}
%%
%% A capa, quando presente, não é contada na numeração das páginas.
%% As páginas iniciais, a partir da folha de rosto, são consideradas na 
%% contagem de páginas, mas não são numeradas.
%% As páginas seguintes (lista de figuras, etc.) por padrão são numeradas com
%% algarismos romanos e aparecem no sumário. Entretanto, se prestyle=empty,
%% não recebem numeração nem aparecem no sumário. 
%% As páginas do conteúdo (da introdução em diante) são numeradas com 
%% algarismos arábicos (13, 14, 15...) e começam a partir de 1.
%%
%% O sumário, por razões óbvias, deve colocado antes de todas as páginas
%% que são mencionadas nele.
%%
%% O trabalho é dividido em elementos pré-textuais, textuais e pós-textuais.
%% Estes elementos (alguns são opcionais, converse com seu orientador)
%% são dispostos preferencialmente na seguinte ordem:
%%    ELEMENTO                COMANDOS MAIS IMPORTANTES
%%       Capa                 \capa
%%    Elementos pré-textuais  \pretextual
%%       Folha de rosto       \folharosto
%%       Ficha catalográfica  \cip (impressa no verso da folha de rosto)
%%       Errata               %deve ser criada como documento avulso
%%       Folha de aprovação   \folhaaprovacao
%%       Dedicatória          \begin{dedicatoria}...\end{dedicatoria}
%%       Agradecimentos       \begin{agradecimentos}...\end{agradecimentos}
%%       Epígrafe             %aluno-poeta, esse recurso não está disponível
%%       Resumo               \begin{resumo}...\end{resumo}
%%       Abstract             \begin{abstract}...\end{abstract}
%%       Lista de Figuras     \figuras
%%       Lista de Tabelas     \tabelas
%%       Lista de Siglas      \printglossary[type=acronym] %usando pacote {glossaries}
%%       Sumário              \sumario
%%    Elementos textuais      \textual
%%       Introdução           \chapter{Introdu\c{c}\~ao} ...
%%       Desenvolvimento      \chapter{Nome do capitulo} \section{Nome da secao} ...
%%       Conclusão            \chapter{Conclus\~ao} ...
%%    Elementos pós-textuais  \postextual
%%       Referências          \bibliographystyle{...} \bibliography %usar BibTeX
%%       Glossário            \printglossary %usando pacote {glossaries}
%%       Apêndices            \apendices \chapter{Nome do apendice} ...
%%       Anexos               \anexos \chapter{Nome do anexo} ...
%%       Índices              \printindex %usando pacote {makeidx}
%%
%% O comando \maketitle equivale a chamar:
%% \pretextual\folharosto\cip\folhaaprovacao
%%
%% A opção "impressao", além de ajustar as margens para melhor
%% encadernação, também faz \maketitle chamar internamente o
%% comando \capa.
%%
%% Caso esteja preparando a versão para visualização em tela
%% (hipertexto), o documento pode ser configurado com o comando
%% \hypersetup a ser chamado no preâmbulo - mais detalhes no
%% manual do pacote hyperref. Algumas opções interessantes,
%% com valores de exemplo, são:
%%   bookmarksnumbered=true,
%%	   (itens das seções exibidas no menu do PDF são numerados)
%%   linktocpage=true,
%%	   (links do sumário nos números de página, não nos nomes de seções)
%%   colorlinks=true,
%%	   (indica links pela cor do texto, não por retângulo ao redor)
%%   linkcolor=red!80!black,
%%	   (cor de links em geral, veja pacote xcolor para opções de cor)
%%   urlcolor=blue,
%%	   (cor de links para URLs - comando \url{http://...})
%%   citecolor=teal,
%%	   (cor de links para referências citadas no texto)
%%   pdfstartview=FitH
%%	   (PDF exibido inicialmente com zoom para largura da página)
%%
%% O comando \listas equivale a chamar:
%% \figuras\tabelas
%%
%% O alinhamento e formatação dos títulos é controlado pelos comandos
%% \pretextual, \textual e \postextual, de modo que em cada parte do trabalho
%% os títulos são apresentados de maneira diferente. Se quiser mudar o
%% alinhamento do título numa das partes do trabalho, logo após a chamada ao
%% comando acima, redefina o comando \chapteralign para aplicar o alinhamento
%% desejado. Se quiser fazer outras mudanças no formato (por exemplo, colocar
%% os títulos em versalete (small-caps), será necessário redefinir o comando
%% \chapterformat (veja exemplo no código da classe).
%%
%% Redefina o comando \fontelogo para mudar o nome da fonte a ser utilizada
%% no logo da UnB, sendo que o padrão é "Arial" (XeLaTeX) ou "ua1" (LaTeX).
%% Deve-se trocar por uma fonte parecida (como a Helvetica, "phv" no LaTeX)
%% apenas se não for possível a instalação da Arial.
%%
%% A classe adicionalmente provê o ambiente {definition}, que exibe
%% definições (conceituais) numeradas e formatadas com borda.
%%
%% Alguns dos comandos a serem chamados no preâmbulo (parte do código antes
%% da chamada a \begin{document}) são:
%% \title[] - Título do trabalho.
%% \subtitle[] - Subtítulo do trabalho (se houver).
%% \palavraschave[] - Lista de palavras-chave em português.
%% \keywords[] - Lista de palavras-chave em inglês.
%%   Os parâmetros opcionais definem como o valor será apresentado na página
%%   da CIP e nas propriedades do PDF, já que estas não podem conter macros
%%   (ex.: \title[Um estudo sobre π elevado a π]{Um estudo sobre $\pi^\pi$}).
%% \diamesano - Dia mês e ano.
%% \autor - Nome e sobrenome do autor.
%% \coautor - Nome e sobrenome do co-autor (se houver).
%% \coordenador[a] - Coordenador(a) do curso.
%% \orientador[a] - Orientador(a) do trabalho.
%% \coorientador[a] - Coorientador(a) do trabalho (se houver).
%% \membrobanca - Adiciona membros à banca (além do orientador e coorientador).
%% \CDU - Classificação Decimal Universal (por padrão é 004).
%%   Valores comuns para a área (conforme http://www.udcc.org/) são:
%%    004 Ciência da Computação e Tecnologia
%%    004.2	Arquitetura de computadores
%%    004.3	Hardware
%%    004.4	Software
%%    004.5	Interação homem-máquina
%%    004.6	Dados
%%    004.7	Comunicação de computadores
%%    004.8	Inteligência artificial
%%    004.9	Técnicas de informática orientadas a aplicação
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PROBLEMAS CONHECIDOS:
%%
%% * O pacote hyperref, embora muito útil para gerar um PDF para leitura em
%%   tela, tem inúmeros problemas de compatibilidade com outros pacotes -
%%   alguns só funcionam corretamente se forem carregados antes do hyperref.
%%   A opção [hyperref] (ou seu sinônimo [hyperref=load]) carregam o pacote
%%   na própria classe, o que impossibilita que algum pacote no documento do
%%   aluno seja carregado antes do hyperref. Neste caso, usar a opção
%%   [hyperref=config] junto com o comando \ifhyperref para carregar o
%%   hyperref apenas quando estiver sendo gerada uma versão para leitura em
%%   tela, como no seguinte exemplo:
%%
%%     %%% não carrega nameref com opção [impressao] 
%%     \ifhyperref{\usepackage{nameref}}{}
%%     %%% varioref só funciona se carregado entre nameref e hyperref
%%     \usepackage{varioref}
%%     %%% não carrega hyperref com opção [impressao] 
%%     \ifhyperref{\usepackage{hyperref}}{}
%%
%% * Recomenda-se o uso do XeTeX ou pdfTeX, já que o dvips (+ps2pdf)
%%   não suporta adequadamente links com quebra de linha. Quem deseja usar os
%%   recursos gráficos do PSTricks pode experimentar o pacote TikZ como
%%   alternativa que não depende de diretivas PostScript.
%% * O suporte para o modo matemático ainda não está completo no XeTeX. Se seu
%%   trabalho depende significativamente de fórmulas e equações, use o LaTeX
%%   (ou XeLaTeX com \usepackage[no-math]{fontspec} e uma fonte matemática do
%%   LaTeX que combine com a fonte escolhida para o texto).
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ORIENTAÇÕES TIPOGRÁFICAS:
%%
%% * Atenção aos diferentes tipos de traço:
%%      - O hífen (-) liga prefixos, sufixos, partículas e pronomes oblíquos
%%        (ex.: recordar-se, fazê-lo, co-habitar).
%%      - A meia-risca (--) indica intervalos numéricos e liga palavras
%%        independentes (ex.: páginas 1--5, viagem Londres--Estocolmo, São João
%%        del-Rei--MG).
%%      - O travessão (---) é usado em diálogos, quando o interlocutor muda,
%%        e pode substituir dois pontos, parênteses ou vírgulas em apostos.
%%   Antes e depois de travessão emprega-se espaço, nos demais casos não há 
%%   espaço.
%% * O ponto final marca o fim de uma sentença. Se o ponto for usado com outra
%%   finalidade, como numa abreviatura, usar \ (ou ~ se não quiser permitir 
%%   quebra de linha) para indicar ao TeX que não se trata de fim de sentença
%%   (ex.: Dr.\ Spock).
%% * Embora o padrão das normas ABNT (que, com suas "receitinhas de bolo", são
%%   bastante rudimentares quanto à tipografia) seja espaçamento duplo entre 
%%   linhas, o espaçamento deve ser escolhido de acordo com o tipo e tamanho
%%   das letras.
%%   A regra a ser seguida é: quanto maiores as linhas (quanto mais palavras
%%   por linha), maior deve ser o espaçamento entre elas. Muitas vezes o
%%   espaçamento simples é suficiente numa fonte bem elaborada, mas se o
%%   tamanho médio da linha for superior a 90 caracteres, pode-se aumentar a
%%   legibilidade definindo um modesto incremento de espaçamento (algo entre
%%   \SetSinglespace{1.1} e \SetSinglespace{1.15}).
%% * Como um trabalho acadêmico tem margens relativamente estreitas, para
%%   evitar que as linhas sejam muito longas, em modo final esta classe utiliza
%%   tamanho 12pt.
%%   Deve haver interesse nas opções 10pt ou 11pt apenas se estiver sendo
%%   utilizada uma fonte particularmente grande (por exemplo, que produza uma
%%   média inferior a 80 caracteres por linha a 12pt).
%% * Na tipografia brasileira e portuguesa é costume recuar (indentar) a
%%   primeira linha de cada parágrafo. Como esse recuo serve para destacar
%%   visualmente um parágrafo de seu anterior, o LaTeX não faz o recuo no
%%   primeiro parágrafo sob um título. Quem quiser indentar também o primeiro
%%   parágrafo só para "manter o costume" deve adicionar o pacote {indentfirst}
%%   ao seu documento.
%% * Citações com até três linhas ficam no próprio texto, marcadas por "aspas".
%%   Se o texto original contiver "aspas", trocá-las por 'aspas simples'.
%%   Se a citação tiver mais de três linhas e apenas um parágrafo, usar o
%%   ambiente {quote}. Se a citação tiver mais de um parágrafo, usar
%%   {quotation}. Nestes dois casos, não se deve circundar sua citação por
%%   aspas nem alterar as aspas do texto original.
%%   Se a citação começar com letra maiúscula, o texto imediatamente anterior
%%   deve terminar em dois pontos (:).
%% * Números ordinais em inglês são sucedidos por "st", "nd", "rd" ou "th",
%%   de acordo com o seguinte algoritmo:
%%      Se o número termina em 1 mas não termina em 11, use "st".
%%      Se o número termina em 2 mas não termina em 12, use "nd".
%%      Se o número termina em 3 mas não termina em 13, use "rd".
%%      Em quaisquer outros casos, use "th".
%%   Esse indicador de ordinal deve, preferencialmente, ser colocado como texto
%%   superscrito. Usar 112\textsuperscript{th} e não 112$^{th}$. Se não quiser
%%   se preocupar com essas regras, use o pacote {engord} com o comando
%%   \engordnumber{112}.
%% * Para indicar elipse (reticências), use \textellipsis,
%%   usar ... (ponto ponto ponto) não é a mesma coisa.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIM DA DOCUMENTAÇÃO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{unb-cic}[2008/06/05 v0.93 Classe para trabalhos CIC UnB]

%%
%% --- Contextualização do departamento ---
%%

\def\@cdu{004}
\def\@departamento{Departamento de Ci\^{e}ncia da Computa\c{c}\~{a}o}
\def\@instituto{Instituto de Ci\^{e}ncias Exatas}
\def\@universidade{Universidade de Bras\'{\i}lia}
\def\@siglauni{UnB}
\def\@cidade{Bras\'ilia}
\def\@uf{DF}
\def\@cidadeuf{\@cidade--\@uf}
\def\@pais{Brasil}

%%
%% --- Valores para CIP ---
%%

\def\@ilustracao{: il.\ }
\def\@formatocapa{29,5 cm}

%%
%% --- Definição de opções ---
%%
\RequirePackage{xkeyval}

%espaçamento de linhas
\newif\if@singlespacing
\newif\if@onehalfspacing
\newif\if@baselineskip
\DeclareOptionX{singlespacing}{\@singlespacingtrue \@onehalfspacingfalse}
\DeclareOptionX{onehalfspacing}{\@onehalfspacingtrue \@singlespacingfalse}
\DeclareOptionX{doublespacing}{\@singlespacingfalse \@onehalfspacingfalse}%\else
\DeclareOptionX{baselineskip}{\@baselineskiptrue}

%opções de curso
\newif\if@posgraduacao\@posgraduacaofalse%
\DeclareOptionX{bacharelado}{%
                    \gdef\@nomecurso{Bacharelado em Ci\^encia da
                       Computa\c{c}\~ao}%
                    \gdef\@mododeescrita{Monografia}}%

\DeclareOptionX{licenciatura}{%
                    \gdef\@nomecurso{Curso de Computa\c{c}\~ao ---
                      Licenciatura}
                    \gdef\@mododeescrita{Monografia}}%


\def\@nomecurso{\@empty}%
\def\@assunto{Monografia (\@ifundefined{XeTeXversion}{Gradua\c{c}\~ao}{Graduação})}
\DeclareOptionX{mestrado}{\@posgraduacaotrue%
					\gdef\@nomecurso{Mestrado}
                    \gdef\@assunto{Disserta\c{c}\~ao (Mestrado)}%
                    \gdef\@mododeescrita{Disserta\c{c}\~ao}}%

\DeclareOptionX{doutorado}{\@posgraduacaotrue%
					\gdef\@nomecurso{Doutorado}
                    \gdef\@assunto{Tese de Doutorado}%
                    \gdef\@mododeescrita{Disserta\c{c}\~ao}}%

\DeclareOptionX{ppginf}{%
					\gdef\@nomeDoPrograma{Inform\'{a}tica}}%

\newif\if@ppca\@ppcafalse%
\DeclareOptionX{ppca}{\@ppcatrue%
					\gdef\@nomeDoPrograma{Computa\c{c}\~{a}o Aplicada}%
					\gdef\@nomecurso{Mestrado Profissional}}%

%modo de geração do PDF
\newif\if@ForScreenView
\newif\if@LoadHyperref
\DeclareOptionX{impressao}{\@ForScreenViewfalse\@LoadHyperreffalse}
\DeclareOptionX{hyperref}[load]{\@ForScreenViewtrue%
	\def\@tempa{#1}\def\@tempb{load}\def\@tempc{config}%
	\ifx\@tempa\@tempb\@LoadHyperreftrue%
	\else%
		\ifx\@tempa\@tempc\@LoadHyperreffalse%
		\else
			\ClassError{unb-cic}
				{Valor invalido para opcao hyperref: #1}
				{Valores validos: hyperref,hyperref=load,hyperref=config}
		\fi
	\fi%
}

%fontes
\def\fontelogo{\@ifundefined{XeTeXversion}{ua1}{Arial}}
\DeclareOptionX{10pt}{\gdef\@fontsize{10pt}}
\DeclareOptionX{11pt}{\gdef\@fontsize{11pt}}
\DeclareOptionX{12pt}{\gdef\@fontsize{12pt}}

%estilos das páginas
\DeclareOptionX{prestyle}{\gdef\style@pretextual{#1}}
\DeclareOptionX{textstyle}{\gdef\style@textual{#1}}
\DeclareOptionX{chapstyle}{\gdef\style@chapter{#1}}

%rascunho (draft)
\newif\if@draftthesis
\DeclareOptionX{draft}{\@draftthesistrue}

%%
%% --- Processamento de opções e classe-base ---
%%

%repassa opções desconhecidas
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{report}}

%default options
\ExecuteOptionsX{onehalfspacing,hyperref,prestyle=plain,textstyle=plain,chapstyle=plain}
\ProcessOptionsX\relax

\newcommand{\ifhyperref}[2]{\if@ForScreenView #1\else #2\fi}

%define macro apenas se estiver indefinida 
\def\@defifundef#1#2{\begingroup\expandafter\ifx\csname #1\endcsname\relax%
\expandafter\gdef\csname #1\endcsname{#2}
\fi\endgroup}

\if@draftthesis
	\PassOptionsToPackage{headheight=13pt,margin={2cm,1.5cm}}{geometry}
    \@singlespacingfalse \@onehalfspacingtrue %força onehalfspacing
    \@defifundef{@fontsize}{11pt}
\else
	\PassOptionsToPackage{headheight=15pt,vmargin={3cm,2cm}}{geometry}
	\if@ForScreenView
	\PassOptionsToPackage{hmargin={2.5cm,2.5cm}}{geometry}
    \else
	\PassOptionsToPackage{hmargin={3cm,2cm}}{geometry}
    \fi%
    \@defifundef{@fontsize}{12pt}
% \fi

\LoadClass[\@fontsize]{report}

%%
%% --- Pacotes requeridos ---
%%

\@ifundefined{XeTeXversion}{%
	\PassOptionsToPackage{pdftex}{hyperref}

	\RequirePackage{fixltx2e} %resolve defeitos do LaTeX
	\RequirePackage{relsize} %utilizada no \@logo
	\def\@textscale#1#2{\textscale{#1}{#2}}
}{
	\PassOptionsToPackage{xetex}{hyperref}

	\def\@textscale#1#2{{\addfontfeatures{Scale=#1}#2}}
}%
\PassOptionsToPackage{pdfdisplaydoctitle=true,pagebackref}{hyperref}

\if@LoadHyperref
	\RequirePackage{hyperref}
\fi

\RequirePackage{graphicx}
\RequirePackage{boites}
\RequirePackage[a4paper,includefoot]{geometry}

\if@baselineskip\else
	%define o espaçamento pelo setspace
	\RequirePackage{setspace}
\fi

%para gerar o label {TotPaginas}
\RequirePackage{atbegshi}
\newcounter{TotPaginas}

%%
%% --- Adaptação da classe-base ---
%%
\newcommand{\chapterformat}{%formatação de título de capítulos
\Huge \bfseries
}

\newcommand{\chapteralign}{%alinhamento de título de capítulos
	\ClassError{unb-cic}
			{Comando \protect\pretextual\space nao foi chamado}
			{Nao pode haver titulos antes do comando \protect\pretextual}
}

%suporte para alinhamento e formatação configurável
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \chapteralign \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \chapterformat #1\par\nobreak
    \vskip 40\p@
  }}

\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \chapteralign
    \normalfont
    \interlinepenalty\@M
    \chapterformat  #1\par\nobreak
    \vskip 40\p@
  }}

%tira \MakeUppercase forçado nos cabeçalhos
\let\old@MakeUppercase\MakeUppercase
\let\old@markboth\markboth
\def\markboth#1#2{\def\MakeUppercase##1{##1}\old@markboth{#1}{#2}\let\MakeUppercase\old@MakeUppercase}
\let\old@markright\markright
\def\markright#1{\def\MakeUppercase##1{##1}\old@markright{#1}\let\MakeUppercase\old@MakeUppercase}
	
%evita órfãs/viúvas e quebras de nota de rodapé
\clubpenalty=9999
\widowpenalty=9999
\interfootnotelinepenalty=5000
\raggedbottom

%aproxima itens de lista
\def\changeitemsep{\setlength{\itemsep}{.5\itemsep}}
\let\old@enumerate=\enumerate
\def\enumerate{\old@enumerate%
\changeitemsep}
\let\old@itemize=\itemize
\def\itemize{\old@itemize%
\changeitemsep}

%espaçamento entre linhas de verse, quote e quotation
%deve ser simples e com fonte menor
\let\old@quote\quote
\let\old@endquote\endquote
\renewenvironment*{quote}
	{\old@quote\begin{singlespace}\small}
	{\end{singlespace}\old@endquote}

\let\old@quotation\quotation
\let\old@endquotation\endquotation
\renewenvironment*{quotation}
	{\old@quotation\begin{singlespace}\small}
	{\end{singlespace}\old@endquotation}
	
\let\old@verse\verse
\let\old@endverse\endverse
\renewenvironment*{verse}
	{\old@verse\begin{singlespace}\small}
	{\end{singlespace}\old@endverse}

%novo ambiente definition
\newcommand{\definitioname}{Defini\c{c}\~ao}
\newcounter{definition}
\newenvironment{definition}
	{\refstepcounter{definition}%
	\let\old@fboxsep\fboxsep\setlength{\fboxsep}{1em}%
	\vskip.5\fboxsep\breakbox%
	\noindent\textbf{\definitioname~\arabic{definition}\ \ }}
	{\endbreakbox\vskip.5\fboxsep%
	\setlength{\fboxsep}{\old@fboxsep}}


%table figures automáticas no ambiente #1
\newcommand{\SetTableFigures}[1]{
	\expandafter\let\csname old@#1\expandafter\endcsname\csname #1\endcsname
	\expandafter\let\csname old@end#1\expandafter\endcsname\csname end#1\endcsname
	\renewenvironment{#1}
	{\begingroup\@tablefigures\csname old@#1\endcsname}
	{\csname old@end#1\endcsname\endgroup}
}

%adiciona item ao sumario
\def\addtocchapter#1{
	\cleardoublepage
	\phantomsection %ajusta referencia hyperref
	\addcontentsline{toc}{chapter}{#1}
}

%configura a seção de referências
\expandafter\let\expandafter\@bibliography\csname bibliography\endcsname%
\renewcommand{\bibliography}[1]{%
	%renomeia a seção após influência maligna do Babel
	\renewcommand*{\bibname}
		{\@ifundefined{XeTeXversion}{Refer\^encias}{Referências}}
	\addtocchapter{\bibname}
	\singlespacing\@bibliography{#1}\defaultspacing}

%maketitle para gerar as páginas iniciais
\def\maketitle{%
	\if@ForScreenView\relax\else\capa\fi
	\pretextual\folharosto\cip\folhaaprovacao
}

%comandos em português e simplificados
\def\figuras{\addtocchapter{\listfigurename}\listoffigures} %adiciona ao sumario
\def\tabelas{\addtocchapter{\listtablename}\listoftables} %adiciona ao sumario
\def\listas{\figuras\tabelas} %imprime as duas listas em ordem
\def\sumario{\tableofcontents} %apenas traduz
\def\apendices{\appendix} %apenas traduz
\def\anexos{\par%muda nome e estilo de numeracao
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{Anexo}%
  \gdef\thechapter{\@Roman\c@chapter}}

%suporte hyperref para anexos
\ifhyperref{%
	\def\Hy@annexstring{annex}
	\let\HyOrg@anexos\anexos
	\def\anexos{%
		\gdef\theHchapter{\Roman{chapter}}%
		\xdef\Hy@chapapp{\Hy@annexstring}%
		\HyOrg@anexos
	}
}{}

%%
%% --- Macros/comandos auxiliares ---
%%
\def\prof{\@ifnextchar[{\@prof@}{\@prof}}
\def\@prof#1{Prof.\ #1}
\def\@prof@[#1]#2{Prof.\nobreak\kern-.05em\textordfeminine\ #2}

\def\dr{\@ifnextchar[{\@dr@}{\@dr}}
\def\@dr#1{Dr.\ #1}
\def\@dr@[#1]#2{Dr.\nobreak\kern-.05em\textordfeminine\ #2}

%%
%% --- Páginas do trabalho ---
%%

\def\@lskipoffset#1{%quebra linha segundo referencia
	\begingroup%
		\newskip\len@lskipoffset%referência de espaçamento
		\setlength{\len@lskipoffset}{-.275\len@uadesch}%
		\addtolength{\len@lskipoffset}{#1\len@uacaph}%
		\\[\len@lskipoffset]%
	\endgroup%
}
\newcommand*{\@logosize}{20}%tamanho da fonte utilizada (em pt)
\newcommand{\@logo}[1][positivo_cor]{%imprime o logo da UnB
	\begingroup%
		\newskip\len@brasiliaw%largura da palavra Brasilia
		\newskip\len@uadesch%URW Arial descender height
		\newskip\len@uacaph%URW Arial cap height
		%
		\begin{spacing}{0}%tira espaço entre linhas
        \@ifundefined{XeTeXversion}
	{\fontfamily{\fontelogo}}%
			{\fontspec{\fontelogo}}%
		\fontsize{\@logosize}{0}\bfseries\selectfont%
		\settodepth{\len@uadesch}{jgpy}\settoheight{\len@uacaph}{B}%desc & cap heights
		\settowidth{\len@brasiliaw}{Bras\'ilia}%
		\addtolength{\len@brasiliaw}{-.105em}%ajusta pequeno espaço em branco antes do B desta fonte
		\includegraphics[width=\len@brasiliaw]{#1}\\[.63\len@uacaph]%logo com a largura da palavra Brasilia
		\@universidade\@lskipoffset{.5}%
		\@textscale{.5}{\@instituto}\@lskipoffset{.25}%
		\@textscale{.5}{\@departamento}%
		\end{spacing}%
	\endgroup
}

\newcommand\pretextual{%
	\renewcommand{\chapteralign}{\centering}
    \renewcommand{\chapterformat}{\Huge \bfseries \thispagestyle{\style@pretextual}}
	\cleardoublepage\pagenumbering{roman}
	\@pagestyle{\style@pretextual}
	\AtBeginShipout{\stepcounter{TotPaginas}}
}

\newcommand\textual{%
	\renewcommand{\chapteralign}{\raggedright}
    \renewcommand{\chapterformat}{\Huge \bfseries \thispagestyle{\style@chapter}}
	\cleardoublepage\pagenumbering{arabic}
	\@pagestyle{\style@textual}
}
	
\newcommand\postextual{%
	\renewcommand{\chapteralign}{\centering}

	%lining figures em section e subsection
	\renewcommand\thesection{\thechapter.\protect\textlinf{\arabic{section}}}
	\renewcommand\thesubsection{\thesection.\protect\textlinf{\arabic{subsection}}}
	\renewcommand\thesubsubsection{\thesubsection.\protect\textlinf{\arabic{subsubsection}}}
	
	%evita problema com bookmarksnumbered=true 
	\pdfstringdefDisableCommands{\renewcommand*{\textlinf}[1]{##1}}
}

%titulo e subtitulo do trabalho
\renewcommand*{\title}{\@dblarg\set@title}%
\newcommand*{\set@title}[2][]{%
	\xdef\@title{#1}
	\xdef\@maintitle{#2}
}
\newcommand*{\subtitle}{\@dblarg\set@subtitle}
\newcommand*{\set@subtitle}[2][]{%
	\gdef\@subtitle{#2}
	\xdef\@title{\expandafter{\@title}: #1}
}

%definicao de  palavras-chave - para cip e resumo/abstract
\newcommand*{\keywords}{\@dblarg\set@keywords}
\newcommand*{\set@keywords}[2][]{%
	\gdef\@keywords{#1}
	\gdef\@@keywords{#2}
}
\newcommand*{\palavraschave}{\@dblarg\set@palavraschave}
\newcommand*{\set@palavraschave}[2][]{%
	\gdef\@palavraschave{#1}
	\gdef\@@palavraschave{#2}
}

%data do trabalho
\def\diamesano#1#2#3{\def\@dia{#1}%
                     \def\@mes{#2}%
                     \def\@ano{#3}}

%definicao do CDU - Classificação Decimal Universal
\def\CDU#1{\gdef\@cdu{#1}}

%definicao do autor
\newcommand{\autor}[2]{
	\def\primeiroautor{#1\ #2}% Único autor em ordem Prenome Nome
	\def\primeiroautorinv{#2,\ #1}% Único autor em ordem Nome, Prenome
	\author{\primeiroautor}
}

%definicao do coautor
\newcommand{\coautor}[2]{
	\if@posgraduacao
		\ClassError{unb-cic}
			{Comando \protect\coautor\space invalido para mestrado}
			{Apenas trabalhos de graduacao podem ter mais de um autor}
	\fi
	\@ifundefined{primeiroautor}{
		\ClassError{unb-cic}
			{Comando \protect\autor\space deve ser chamado antes de \protect\coautor\space}
			{O autor principal deve ser definido antes do secundario}
	}{}
	\def\segundoautor{#1\ #2}% Autor secundário em ordem Prenome Nome
	\def\segundoautorinv{#2,\ #1}% Autor secundário em ordem Nome, Prenome
	\author{\primeiroautor\\ \segundoautor}
}

%definicao do coordenador do curso
\def\coordenador{\@ifnextchar[%]
              {\at@coorda}%Se primeiro argumento opcional chama esta
              {\at@coordo}}%senão chama esta rotina

\def\at@coorda[#1]#2#3{\def\@sexocoordenador{Coordenadora}%
                        \def\@nomecoordenador{#2}%
                        \def\@filicoordenador{#3}}

\def\at@coordo#1#2{\def\@sexocoordenador{Coordenador}%
                        \def\@nomecoordenador{#1}%
                        \def\@filicoordenador{#2}}

%definicao do orientador
\def\orientador{\@ifnextchar[%]
              {\at@orienta}%Se primeiro argumento opcional chama esta
              {\at@oriento}}%senao chama esta rotina

\def\at@orienta[#1]#2#3{\def\@sexoorientador{Orientadora}%
                        \def\@nomeorientador{#2}%
                        \def\@filiorientador{#3}}

\def\at@oriento#1#2{\def\@sexoorientador{Orientador}%
                        \def\@nomeorientador{#1}%
                        \def\@filiorientador{#2}}

%definicao do coorientador
\newif\if@coorientador
\def\coorientador{\@coorientadortrue \@ifnextchar[%]
              {\at@coorienta}%Se primeiro argumento opcional chama esta
              {\at@cooriento}}%senao chama esta rotina

\def\at@coorienta[#1]#2#3{\def\@sexocoorientador{Coorientadora}%
                        \def\@nomecoorientador{#2}%
                        \def\@filicoorientador{#3}}%
                        %%%\@defsegundomembro{#2}{#3}}

\def\at@cooriento#1#2{\def\@sexocoorientador{Coorientador}%
                        \def\@nomecoorientador{#1}%
                        \def\@filicoorientador{#2}}%
                        %%%\@defsegundomembro{#1}{#2}}

% definicao da banca
% o orientador é sempre o primeiro membro da banca
% o coorientador, se existir, é o segundo membro da banca
% o quarto membro é opcional
\newif\if@quartomembro
\def\@defsegundomembro#1#2{\def\@nomedois{#1}\def\@filidois{#2}}
\def\@defterceiromembro#1#2{\def\@nometres{#1}\def\@filitres{#2}}
\def\@defquartomembro#1#2{\def\@nomequatro{#1}\def\@filiquatro{#2}\@quartomembrotrue}

\def\membrobanca#1#2{
	\ifx\@nomedois\undefined
		\@defsegundomembro{#1}{#2}
	\else
		\ifx\@nometres\undefined
			\@defterceiromembro{#1}{#2}
		\else
			\ifx\@nomequatro\undefined
			     	\@defquartomembro{#1}{#2}
			\else		
			     	\ClassError{unb-cic}
			     		{A banca so pode ter 3 ou 4 membros}
			     		{Lembrar que orientador e coorientador ja fazem parte da banca}
			\fi
		\fi
	\fi
}

\newenvironment{paginatitulo}
	{\cleardoublepage\thispagestyle{empty}}
	{}

\newenvironment{agradecimentos}
	{\begin{paginatitulo}%
	\pdfbookmark{Agradecimentos}{acknowledgements}%
		\chapter*{Agradecimentos}}%
	{\end{paginatitulo}}

\renewenvironment{abstract}
	{\begin{paginatitulo}%
	\begin{otherlanguage*}{english}
	\pdfbookmark{Abstract}{abstract}%
		\chapter*{Abstract}}%
		{\vskip 15pt\noindent\textbf{Keywords:}\ \@@keywords%
	\end{otherlanguage*} 
	\end{paginatitulo}}

\newenvironment{resumo}
	{\begin{paginatitulo}%
	\pdfbookmark{Resumo}{resumo}%
	\chapter*{Resumo}}%
		{\vskip 15pt\noindent\textbf{Palavras-chave:}\ \@@palavraschave%
    \end{paginatitulo}}

\newenvironment{dedicatoria}
	{\begin{paginatitulo}%
	\pdfbookmark{Dedicat\'oria}{dedication}%
		\chapter*{Dedicat\'oria}}%
	{\end{paginatitulo}}

\def\@printfulltitle{%
	\@ifundefined{@subtitle}{%
		\textbf{\Large \@title}%
	}{%
		\textbf{\Large\@maintitle\\[1ex]\large\@subtitle}%
	}\par%
}

\newcommand\capa{
  \begin{paginatitulo}%
	\onehalfspacing%
        \begin{center}%
             \@logo[contorno_preto]
             \null\vfill%
             \@printfulltitle%
             \vfill%
             {\large \@author}%
             \vfill%
            {\large \@cidade}\\
            {\large \@ano}%
       \end{center}%
	\defaultspacing%
  \end{paginatitulo}%
}

\newcommand\folharosto{%
	\begin{paginatitulo}%
		\onehalfspacing%
		\begin{center}%
			\@logo\vfill%
			\@printfulltitle\vfill%
			{\large\@author}\vfill%
			\@mododeescrita\ %
			\if@posgraduacao%
				\if@ppca%
					apresentada como requisito parcial para conclus\~ao do\\
					\@nomecurso\ em \@nomeDoPrograma%
				\else%
					apresentada como requisito parcial para\\
					conclus\~ao do \@nomecurso\ em \@nomeDoPrograma%
				\fi%
			\else%
				apresentada como requisito parcial\\
				para conclus\~ao do \@nomecurso%
			\fi%
			\vfill%
			\@sexoorientador\\\@nomeorientador\\%
			\if@coorientador
				\vskip 1cm\@sexocoorientador\\\@nomecoorientador
			\fi
			\vfill%
			{\large\@cidade}\\
			{\large\@ano}%
		\end{center}%
		\defaultspacing%
	\end{paginatitulo}%
}

\newcommand\folhaaprovacao{%
	\begin{paginatitulo}%
		\onehalfspacing%
		\begin{center}%
			\@logo\vfill%
			\@printfulltitle\vfill%
			{\large\@author}\vfill%
			\@mododeescrita\ %
			\if@posgraduacao%
				\if@ppca%
					apresentada como requisito parcial para conclus\~ao do\\
					\@nomecurso\ em \@nomeDoPrograma%
				\else%
					apresentada como requisito parcial para\\
					conclus\~ao do \@nomecurso\ em \@nomeDoPrograma%
				\fi%
			\else%
				apresentada como requisito parcial\\
				para conclus\~ao do \@nomecurso%
			\fi%
			\vfill%
			\@nomeorientador\ (\@sexoorientador)\\
			\@filiorientador\\[1cm]
			\begin{tabular}{cc}
				\@nomedois & \@nometres\\
				\@filidois & \@filitres
			\end{tabular}\\[1cm]
			\if@quartomembro
				\@nomequatro\\%
				\@filiquatro\\[1cm]
			\fi
			\@nomecoordenador\\
			\@sexocoordenador \ do\ %
			\if@posgraduacao Programa de P\'{o}s-gradua\c{c}\~{a}o em \@nomeDoPrograma\else \@nomecurso\fi%
			\vfill%
			{\large \@cidade, \@dia\ de \@mes\ de \@ano}
		\end{center}%
		\defaultspacing%
	\end{paginatitulo}%
}

%quadrado da CIP
\def\@quadrado{%
	\def\@boxwidth{13cm}%
	\def\@boxparwidth{12.75cm}%
	\def\@quadskip{0.5em}%
	\def\@qquadskip{1em}%
    \framebox{
    	\hskip\@quadskip%
		\parbox{\@boxwidth}{
			\vskip\@quadskip%
			\primeiroautorinv.\\[\baselineskip]%
			\mbox{\hskip\@quadskip}%
			\parbox{\@boxparwidth}{%
				\@title\ / %
				\@ifundefined{segundoautor}
					{\primeiroautor}%apenas um autor
					{\primeiroautor, \segundoautor}.%dois autores
				\ \@cidade\ :\ \@siglauni, \@ano.\\%
				\csname ref\endcsname{TotPaginas} p. \@ilustracao; \@formatocapa.\\[\baselineskip]%
				\@assunto\ --- \@universidade, \@cidade, \@ano.\\[\baselineskip]%
 				\parbox{\@boxparwidth}{\raggedright\numerarcip{\@palavraschave}}%
			}\\[\baselineskip]%
			CDU \textlinf{\@cdu}%
			\vskip\@quadskip%
		}%
		\hskip\@qquadskip%
	}%
}
\def\@gobblespace#1{#1}
\def\numerarcip#1{
	\newcount\@tempa\@tempa=1
	\expandafter\r@numerarcip\expandafter\@tempa#1,\@nil%
}
\def\r@numerarcip#1#2,#3\@nil{
	\the#1.~\@gobblespace#2%
	\ifx#3\empty\else\advance#11,\r@numerarcip#1#3\@nil\fi%
}

\def\cip{
	\begin{paginatitulo}\noindent\onehalfspacing%
		\@universidade\ --- \@siglauni\\
		\@instituto\\
		\@departamento\\%
		\if@posgraduacao P\'{o}s-gradua\c{c}\~{a}o em \@nomeDoPrograma\else\@nomecurso\fi%

		\vfill\noindent%
		\@sexocoordenador: \@nomecoordenador

		\vfill\noindent%
		Banca examinadora composta por:\par\vskip 2mm %
		\indent
			\begin{tabular}{l}%
				\@nomeorientador\ (\@sexoorientador) --- \@filiorientador\\
 				\@nomedois\
 				%%\if@coorientador
 					%%(\@sexocoorientador)
 				%%\fi
 				 --- \@filidois\\
  				\@nometres\ --- \@filitres
	 			\if@quartomembro
					\\\@nomequatro\ --- \@filiquatro
 				\fi
			\end{tabular}

		\vfill\noindent%
		\textbf{CIP --- Cataloga\c{c}\~{a}o Internacional na Publica\c{c}\~{a}o}%
		\vskip 15pt
		\@quadrado%

 		\vfill\noindent%
		\begin{tabular}{ll}%
		Endere\c{c}o: & \@universidade\\
		& Campus Universit\'ario Darcy Ribeiro --- Asa Norte\\
		& CEP \textlinf{70910-900} \\ & \@cidadeuf\ --- \@pais
		\end{tabular}
	\end{paginatitulo}\defaultspacing%
}

%%
%% --- Processamento de final e início do documento ---
%%
\AtEndDocument{%
	\addtocounter{page}{-1}%decrementa para depois . . .
    \ifhyperref{%
		\immediate\write\@mainaux{%
			\string\newlabel{TotPaginas}{{\arabic{TotPaginas}}{\thepage}{}{page.\thepage}{}}%
		}%
	}{%
		\immediate\write\@mainaux{%
			\string\newlabel{TotPaginas}{{\arabic{TotPaginas}}{\thepage}}%
		}%
	}
	\addtocounter{page}{1}% . . . incrementar de novo
}

\AtBeginDocument{%
	%define propriedades do PDF e carrega pacotes auxiliares
	\@ifpackageloaded{hyperref}{
    	\hypersetup{
            pdftitle=\@title,
            pdfauthor=\@author,
            pdfsubject=\@assunto,
            pdfkeywords=\@palavraschave}
		\@ifpackageloaded{natbib}{
			%compatibilidade entre natbib e hyperref
    		\RequirePackage{hypernat}
		}{}
		%posiciona melhor os links para captions
        \RequirePackage[all]{hypcap}
	}{
		\RequirePackage{nohyperref} %dummy macros for hyperref
		\RequirePackage{url} %permite quebra de linha em URLs
	}

	%controle do sumario de acordo com o estilo atual,
	%após hyperref carregado porque ele sobrescreve
	%o comando \addcontentsline
	\let\@addcontentsline\addcontentsline
	\def\@emptystr{empty}
	\def\@pagestyle#1{
		\let\@styletoset=#1%
		\pagestyle{\@styletoset}%
		%se estilo for empty, não adiciona ao TOC
		\ifx\@styletoset\@emptystr
			\renewcommand\addcontentsline[3]{\relax}
		\else
			\let\addcontentsline\@addcontentsline
		\fi
	}
	
	%traducoes para glossaries.sty
	\@ifpackageloaded{glossaries}{%
		\@ifundefined{XeTeXversion}{
			\addto\captionsbrazil{%
			\renewcommand*{\glossaryname}{Gloss\'ario}%
			\renewcommand*{\acronymname}{Lista de Abreviaturas e Siglas}%
			\renewcommand*{\entryname}{Entrada}%
			\renewcommand*{\descriptionname}{Descri\c{c}\~ao}%
			\renewcommand*{\symbolname}{S\'\imbolo}%
			\renewcommand*{\pagelistname}{Lista de p\'aginas}%
			\renewcommand*{\glssymbolsgroupname}{S\'imbolos}%
			\renewcommand*{\glsnumbersgroupname}{N\'umeros}}
		}{
			\addto\captionsbrazil{%
			\renewcommand*{\glossaryname}{Glossário}%
			\renewcommand*{\acronymname}{Lista de Abreviaturas e Siglas}%
			\renewcommand*{\entryname}{Entrada}%
			\renewcommand*{\descriptionname}{Descrição}%
			\renewcommand*{\symbolname}{Símbolo}%
			\renewcommand*{\pagelistname}{Lista de páginas}%
			\renewcommand*{\glssymbolsgroupname}{Símbolos}%
			\renewcommand*{\glsnumbersgroupname}{Números}}
		}
	}{}

	\@ifundefined{XeTeXversion}%
	{%suporte para fonte Adobe Minion Pro - pacote LaTeX
		\@ifpackageloaded{MinionPro}{}{%
			\newcommand{\figureversion}[1]{\relax}
		}
		\newenvironment{linfig}{\figureversion{lining}}{\figureversion{text}}%
		\newenvironment{tabfig}{\figureversion{tabular}}{\figureversion{proportional}}%
		\newcommand*{\textlinf}[1]{\figureversion{lining}#1\figureversion{text}}%
		\newcommand*{\texttabf}[1]{\figureversion{tabular}#1\figureversion{proportional}}%
		\newcommand*{\@tablefigures}{\figureversion{lining,tabular}}%
	}%
	{%suporte fontspec - XeTeX
 		\def\@textlinf{\protect\addfontfeatures{Numbers=Lining}}%
 		\def\@texttabf{\protect\addfontfeatures{Numbers=Monospaced}}%
		\newenvironment{linfig}{\bgroup\@textlinf}{\egroup}%
		\newenvironment{tabfig}{\bgroup\@texttabf}{\egroup}%
		\newcommand*{\textlinf}[1]{{\@textlinf #1}}%
		\newcommand*{\texttabf}[1]{{\@texttabf #1}}%
		\newcommand*{\@tablefigures}{\addfontfeature{Numbers={Lining,Monospaced}}}%
		\newcommand*{\slashedzero}{{\addfontfeature{Numbers={Lining,SlashedZero}}0}}%
	}%

	\if@baselineskip
		%para manter o valor inicial
		\newdimen\@oldbaseline

		%define o espaçamento pelo baselinekip
		\@oldbaseline=\baselineskip
		\newcommand{\setstretch}[1]{\setlength{\baselineskip}{#1\@oldbaseline}}
		\newcommand{\singlespacing}{\setstretch{1}}
		\newcommand{\onehalfspacing}{\setstretch{1.35}}
		\newcommand{\doublespacing}{\setstretch{1.7}}
	\fi

	\newcommand{\defaultspacing}{%
		\if@singlespacing\singlespacing%single spacing
			\else\if@onehalfspacing\onehalfspacing%one and half spacing
				\else\doublespacing%double spacing
			\fi%
		\fi}
	\defaultspacing% chamada inicial
}

\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EOF: unb-cic.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
