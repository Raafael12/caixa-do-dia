# Caixa do Dia

Aplicativo simples para **registrar vendas com a forma de pagamento** e **conferir o caixa no fim do dia**, mostrando onde está a diferença e ajudando a encontrar a venda com problema.

Funciona **sem internet** e **sem instalar nada**: depois de descompactar, você cria um atalho **Caixa do Dia** na Área de Trabalho, e o app abre em uma janela própria do Microsoft Edge (ou do Google Chrome).

> O Caixa do Dia é um **aplicativo auxiliar**. Ele **não substitui** o sistema da loja nem a emissão de nota fiscal.

---

## O problema que ele resolve

Este aplicativo nasceu de um projeto de extensão universitária do curso de Análise e Desenvolvimento de Sistemas, feito em uma papelaria de bairro. No diagnóstico, vimos que a **quebra de caixa acontecia quase todo dia**: no fim do expediente, o valor do sistema não batia com o dinheiro contado, e as funcionárias ficavam de 20 a 30 minutos a mais conferindo comprovantes à mão. A causa mais comum era o **registro errado da forma de pagamento** (por exemplo, uma venda paga em dinheiro registrada como cartão), principalmente quando havia dois clientes ao mesmo tempo. O Caixa do Dia torna o registro rápido e, no fechamento, aponta qual forma de pagamento está com diferença e qual venda provavelmente está errada.

## Funcionalidades

- **Abrir o caixa** do dia, com o troco inicial (fundo de troco).
- **Registrar venda em poucos segundos**: digite o valor (estilo caixa eletrônico: `1250` vira `R$ 12,50`) e clique na forma de pagamento, ou aperte `Enter` e a tecla `1` Dinheiro, `2` Débito, `3` Crédito ou `4` Pix.
- **Desfazer a última venda** logo depois de registrar.
- **Vendas de hoje**: lista com filtro por forma de pagamento, **corrigir** (valor, forma ou observação, com histórico do que mudou) e **excluir**.
- **Resumo em tempo real**: total por forma de pagamento, quantidade de vendas, total do dia e dinheiro que deve ter na gaveta.
- **Fechar o caixa**: esperado × conferido para cada forma, com a diferença em cores e texto ("Bateu", "Faltando R$ X", "Sobrando R$ X"). Clique numa forma para ver só as vendas dela.
- **Sugestão de causa**: se uma forma está faltando R$ X e outra está sobrando R$ X, o app mostra as vendas suspeitas e um botão para corrigir na hora.
- **Entradas e retiradas de dinheiro** (reforço de troco, sangria, pagamentos com dinheiro do caixa).
- **Relatório do dia** pronto para imprimir.
- **Histórico** dos dias encerrados, mostrando se bateu ou quanto deu de diferença.
- **Backup** (baixar e restaurar) e **exportar planilha** (CSV para Excel).
- **Configurações**: nome da loja, formas de pagamento (renomear, mudar cor, desativar, adicionar novas, mudar a ordem/tecla), aviso de espaço e arquivamento de dias antigos.
- **Não guarda dados de clientes** (sem nome, CPF ou telefone), em respeito à LGPD.

## Como instalar (uma vez só)

1. **Baixar:** na página do projeto no GitHub, clique no botão verde **Code** e depois em **Download ZIP**.
2. **Desbloquear o ZIP** (para o Windows não bloquear os arquivos `.bat`): na pasta **Downloads**, clique com o botão direito no arquivo ZIP → **Propriedades** → na aba **Geral**, lá embaixo, marque **Desbloquear** → **OK**.
   - Se a opção **Desbloquear** não aparecer, o arquivo já está liberado; pode seguir.
3. **Descompactar:** clique com o botão direito no ZIP → **Extrair tudo…** e escolha um lugar fixo, por exemplo `Documentos`. Vai surgir uma pasta com:
   ```
   Abrir Caixa.bat
   Criar atalho na Área de Trabalho.bat
   README.md, LICENSE
   app\   (o aplicativo)
   docs\  (guia rápido em PDF, para imprimir)
   ```
4. **Criar o atalho:** dentro da pasta extraída, dê dois cliques em **`Criar atalho na Área de Trabalho.bat`**. Aparece a mensagem "Pronto!" e surge o atalho **Caixa do Dia** (com um cifrão verde) na Área de Trabalho.
   - Se aparecer a tela azul **"O Windows protegeu o computador"**, clique em **Mais informações** e depois em **Executar assim mesmo**. Isso acontece porque o arquivo veio da internet; o script só cria o atalho e libera os arquivos do app.
5. **Pronto. Daqui em diante, abra sempre pelo atalho "Caixa do Dia".** O app abre em uma janela própria, sem barra de endereço, e aparece como "Caixa do Dia" na barra de tarefas.
   - Dica: clique com o botão direito no ícone do Caixa do Dia na barra de tarefas → **Fixar na barra de tarefas**.

### Como o atalho funciona

O atalho chama o `Abrir Caixa.bat`, que procura o **Microsoft Edge** (que já vem no Windows 10 e 11) e abre o app em modo aplicativo. Se não houver Edge, usa o **Google Chrome**; se não houver nenhum dos dois, abre no navegador padrão.

O Edge vem **sempre primeiro, de propósito**: as vendas ficam guardadas dentro do navegador, então trocar de navegador faria as vendas "sumirem" (elas continuam no outro navegador, mas não aparecem). **Não abra o app ora pelo Edge, ora pelo Chrome.**

Se mudar a pasta do app de lugar, o atalho para de funcionar: rode de novo o `Criar atalho na Área de Trabalho.bat` na pasta nova.

### Se algo não abrir

- **"Não encontrei o aplicativo"**: o ZIP não foi descompactado. Faça o passo 3 e use os arquivos da pasta extraída.
- **Para conferir o que o lançador faria sem abrir nada**: abra o Prompt de Comando na pasta do app e rode `"Abrir Caixa.bat" /teste`. Ele mostra qual navegador e qual endereço seriam usados.
- **Sem os `.bat`**: dá para abrir `app\index.html` com dois cliques, sempre no mesmo navegador.

## ⚠️ Aviso importante sobre backup

Os dados ficam guardados **somente no navegador deste computador** (no armazenamento local do navegador). Eles **não vão para a internet**.

**Os dados são apagados se:**
- alguém **limpar os dados de navegação** (cookies e dados de sites) do Chrome/Edge;
- o navegador for desinstalado, o perfil do Windows for trocado ou o computador for formatado.

Além disso, cada navegador guarda os seus dados separadamente: o que foi registrado no Chrome não aparece no Edge.

**Por isso: baixe o backup todo dia ao fechar o caixa** (aba **Backup** → **Baixar backup agora**) e guarde o arquivo em um pendrive ou envie para o seu e-mail. Para recuperar, use **Backup → Escolher arquivo de backup…**.

## Como rodar os testes

Abra o arquivo `app/tests/tests.html` no Chrome ou no Edge (dois cliques). A página mostra quantos testes passaram. Os testes não mexem nos dados guardados do caixa.

## Como adaptar para outra loja

Tudo pode ser ajustado em **Configurações**, sem mexer no código:
- **Nome da loja** (aparece no topo e no relatório).
- **Formas de pagamento**: renomeie, troque a cor, desative as que não usa ou adicione novas (ex.: "Vale", "Fiado"). A ordem da lista define a tecla de atalho.

Para quem quer mexer no código:

```
Abrir Caixa.bat                      lançador (Edge > Chrome > navegador padrão)
Criar atalho na Área de Trabalho.bat chama app/criar-atalho.ps1
app/index.html          tela principal
app/icone.ico           ícone do atalho e da janela
app/criar-atalho.ps1    cria o atalho (PowerShell + WScript.Shell) e desbloqueia os arquivos
app/css/style.css       aparência (inclui o estilo de impressão)
app/js/money.js         valores em centavos e formatação em reais
app/js/storage.js       armazenamento, versão dos dados, validação do backup
app/js/caixa.js         regras: dia, vendas, totais, fechamento, sugestão de causa, CSV
app/js/ui.js            telas e eventos
app/js/app.js           inicialização
app/tests/              testes das regras (abrem no navegador)
docs/guia-rapido.pdf    guia de uma página A4 para imprimir e deixar no balcão
```

Os `.bat` são escritos só com caracteres sem acento e com quebra de linha CRLF (o `.gitattributes` garante isso também no ZIP do GitHub). Eles funcionam em pastas com espaços e acentos porque o caminho vem de `%~dp0`, não do texto do arquivo. As mensagens com acento ficam no `.ps1`, salvo em UTF-8 com BOM.

Regras técnicas do projeto:
- HTML, CSS e JavaScript puros, sem bibliotecas nem etapa de build.
- Funciona abrindo direto pelo `file://`: por isso usa `<script>` clássicos (sem módulos ES) e um namespace global `window.Caixa`.
- Todo dinheiro é guardado e somado em **centavos (números inteiros)**.
- As regras de negócio (`money.js`, `caixa.js`) não usam a tela, então podem ser testadas isoladamente.
- Os dados têm um `schemaVersion`; mudanças futuras no formato devem incluir uma migração em `storage.js`.

## Licença

Distribuído sob a [licença MIT](LICENSE). Você pode usar, copiar, modificar e distribuir livremente.

## Contribua

Sugestões e melhorias são muito bem-vindas! Abra uma *issue* no GitHub contando o problema ou a ideia, ou envie um *pull request*. Se você usa o Caixa do Dia no seu comércio, conte para a gente como foi.
