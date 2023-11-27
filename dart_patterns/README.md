
# Base:
    site guru: https://refactoring.guru/pt-br/design-patterns
    Curso Rasbicando padrões de projetos: https://designpatterns.com.br/bn2023/

# Padrões comportamentais

## Strategy

O Strategy é um padrão de projeto comportamental que permite que você defina uma família de algoritmos, coloque-os em classes separadas, e faça os objetos deles intercambiáveis.

“O pa­drão Stra­tegy su­gere que você pegue uma classe que faz algo es­pe­cí­fico em di­ver­sas ma­nei­ras di­fe­ren­tes e ex­traia todos esses al­go­rit­mos para clas­ses se­pa­ra­das cha­ma­das es­tra­té­gias”

“A classe ori­gi­nal, cha­mada con­texto, deve ter um campo para ar­ma­ze­nar uma re­fe­rên­cia para um des­sas es­tra­té­gias. O con­texto de­lega o tra­ba­lho para um ob­jeto es­tra­té­gia ao invés de exe­cutá-lo por conta própria.”

“O con­texto não é res­pon­sá­vel por se­le­ci­o­nar um al­go­ritmo apro­pri­ado para o tra­ba­lho. Ao invés disso, o cli­ente passa a es­tra­té­gia de­se­jada para o con­texto. ”

“ O Stra­tegy é ba­se­ado em com­po­si­ção”
“O Stra­tegy tra­ba­lha a nível de ob­jeto, per­mi­tindo que você tro­que os com­por­ta­men­tos du­rante a execução.”


Padrão de Estratégia: O Mestre dos Planos

Imagine que você é um super-herói do mundo da programação, e o vilão "Código Desorganizado" está ameaçando a legibilidade e manutenibilidade do seu software. Para derrotar esse vilão, você convoca a Liga dos Padrões de Projeto, e um herói se destaca: "O Mestre dos Planos"!

Mestre dos Planos: O que é isso?
O Mestre dos Planos é um super-herói que traz consigo o incrível Padrão de Estratégia. Ele é um mestre na arte de mudar o comportamento de um objeto em tempo de execução. Imagine ter um escudo que se transforma de acordo com a ameaça, ou uma capa que muda de cor dependendo do ambiente. Isso é o Padrão de Estratégia em ação!

Como o Mestre dos Planos Age?
O Mestre dos Planos não é um herói convencional; ele não está preso a uma única forma de lutar. Em vez disso, ele tem diferentes estratégias em sua manga. Ele pode escolher entre uma estratégia de voar pelos céus usando uma capa ou mergulhar nos oceanos com um traje especial. O Padrão de Estratégia permite que ele selecione a estratégia mais apropriada para cada desafio.

Coletando Pagamentos com Estilo
Quando o Mestre dos Planos precisa coletar pagamentos para financiar suas aventuras, ele utiliza diferentes estratégias. Às vezes, ele invoca o PayPal para transações online, enquanto outras vezes ele saca seu cartão de crédito para pagar em grande estilo. O Padrão de Estratégia permite que ele altere suas táticas de pagamento sem modificar sua identidade heroica.

Lembrando do Código Desorganizado
Com o Padrão de Estratégia, o Mestre dos Planos ensina aos seus colegas programadores a importância de manter o código limpo e flexível. Ele mostra que, assim como em uma grande batalha, a chave para a vitória está na adaptação inteligente. Com estratégias bem definidas, o código se torna mais fácil de entender e mais resistente às mudanças.

Então, da próxima vez que você se encontrar em uma batalha contra o Código Desorganizado, chame o Mestre dos Planos e deixe o Padrão de Estratégia guiá-lo para a vitória!


################################################################################################

# Template Method
## “Também conhecido como: Método padrão”

“O Tem­plate Method é um pa­drão de pro­jeto com­por­ta­men­tal que de­fine o es­que­leto de um al­go­ritmo na su­per­classe mas deixa as sub­clas­ses so­bres­cre­ve­rem eta­pas es­pe­cí­fi­cas do al­go­ritmo sem mo­di­fi­car sua estrutura.”

“O pa­drão do Tem­plate Method su­gere que você que­bre um al­go­ritmo em uma série de eta­pas, trans­forme essas eta­pas em mé­to­dos, e co­lo­que uma série de cha­ma­das para esses mé­to­dos den­tro de um único mé­todo pa­drão”


“Uti­lize o pa­drão Tem­plate Method quando você quer dei­xar os cli­en­tes es­ten­der ape­nas eta­pas par­ti­cu­la­res de um al­go­ritmo, mas não todo o al­go­ritmo e sua estrutura.”

“O Tem­plate Method é ba­se­ado em he­rança: ele per­mite que você al­tere par­tes de um al­go­ritmo ao es­ten­der essas par­tes em sub­clas­ses. ”

“O Tem­plate Method fun­ci­ona a nível de classe, então é es­tá­tico.”


**Template Method: A Receita do Desenvolvedor Chef**

O Template Method é como a receita do chef para desenvolvedores. Imagina que você é um chef de cozinha codificando um prato especial no seu restaurante do código-fonte.

**Ingredientes:**

1. **Classe Base (Receita Base):** Aqui, você define a estrutura geral da receita (classe base). É como preparar a panela e a colher de pau.

2. **Métodos Abstratos (Passos da Receita):** Cada passo específico da receita é representado por um método abstrato. São como os passos específicos para preparar cada ingrediente.

3. **Hooks (Toques Pessoais):** Os hooks são métodos opcionais que os chefs (desenvolvedores) podem personalizar. É onde você adiciona seus toques pessoais na receita.

**Modo de Preparo:**

1. **Preparação Inicial (Classe Base):** Defina a estrutura básica da receita, como pré-aquecer o forno (inicializar variáveis).

2. **Passo a Passo Personalizado (Métodos Abstratos):** Cada método abstrato representa um passo específico da receita. Pode ser algo como cortar os legumes (implementação específica nas subclasses).

3. **Adicione Seu Toque (Hooks):** Se você quiser adicionar algo especial à receita, como uma pitada extra de sal (hooks), este é o lugar para fazer isso.

4. **Conclusão (Finalização da Receita):** Finalize o prato, como colocar a sobremesa no prato (finalizar o método).

**Por que é Divertido:**

Imagine que você está seguindo uma receita clássica de brownie. Você tem os passos básicos, mas pode personalizá-los. Adiciona nozes extras, um toque de café (hooks), e voilà, seu brownie exclusivo está pronto!

Da mesma forma, o Template Method permite que os desenvolvedores sigam uma estrutura básica, mas adicionem toques únicos nos lugares certos. É como ser um chef no mundo do código, preparando pratos deliciosos para os usuários. Bon appétit, desenvolvedores! 🍽️

Definição: O padrão template method define o esqueleto de um algoritmo dentro de um método,
transferindo alguns de seus passos para sibclasses. Permite que as subclasses redefinam certos
passos de um algoritmo sem alterar a estrutura do mesmo.

################################################################################################

# Observer
O Observer é um padrão de projeto de software que define uma dependência um-para-muitos entre objetos, de modo que quando um objeto muda seu estado, todos seus dependentes são notificados e atualizados automaticamente.

O padrão Observer é como ter aquele amigo tagarela que sempre te avisa quando algo interessante acontece. Imagina se, em vez de você ficar verificando constantemente se há novidades, esse amigo te grita assim que algo relevante acontece? Esse é o Observer em ação!

No mundo do design de software, o padrão Observer permite que objetos interessados (os "observadores") sejam notificados automaticamente quando o estado de um objeto que estão observando (o "sujeito") muda. É como ter um serviço de notificação VIP para seus objetos, mantendo todos atualizados sem que eles precisem ficar olhando a todo momento.

Então, da próxima vez que estiver desenvolvendo e pensar no Observer, imagine seus objetos como uma turma de amigos bem informados e tagarelas que se comunicam automaticamente quando algo importante acontece. Isso é o Observer no seu melhor, mantendo a galera atualizada e evitando que seus objetos fiquem perdendo os eventos da festa no mundo do software! 🎉👀

“Uti­lize o pa­drão Ob­ser­ver quando mu­dan­ças no es­tado de um ob­jeto podem pre­ci­sar mudar ou­tros ob­je­tos, e o atual con­junto de ob­je­tos é des­co­nhe­cido de an­te­mão ou muda di­na­mi­ca­mente.”

“ Uti­lize o pa­drão quando al­guns ob­je­tos em sua apli­ca­ção devem ob­ser­var ou­tros, mas ape­nas por um tempo li­mi­tado ou em casos específicos.”

# STATE
O padrão de projeto State permite que um objeto altere o seu comportamento quando o seu estado interno muda. O objeto parecerá ter mudado de classe.

Ah, o padrão State, aquele que deixa os objetos se sentindo como adolescentes indecisos! Imagine um objeto que muda de comportamento mais rápido do que uma criança troca de brinquedo. Um dia ele está feliz, no próximo está triste, e você nunca sabe o que esperar. É como lidar com um amigo que acorda de manhã e decide ser uma planta. "Hoje eu sou uma samambaia, amanhã quem sabe?"

O padrão State é basicamente a arte de transformar seu código em um espetáculo de comédia improvisada, onde os objetos podem mudar de personalidade sem aviso prévio. É como se os objetos fossem atores em uma peça teatral, e o padrão State é o roteiro que diz quando devem mudar de cena. E, é claro, toda essa mudança de estado acontece sem nenhum drama (ou talvez com muito drama, dependendo do programador).

Então, da próxima vez que você estiver lidando com o padrão State, lembre-se: seus objetos estão apenas experimentando sua versão de uma crise de identidade cômica. E quem sabe, talvez o próximo estado seja o de um objeto que finalmente decidiu o que quer ser quando crescer!

Resumindo:
 Ele altera o seu comportamento quando o seu estado muda
 “O pa­drão State su­gere que você crie novas clas­ses para todos os es­ta­dos pos­sí­veis de um ob­jeto e ex­traia todos os com­por­ta­men­tos es­pe­cí­fi­cos de es­ta­dos para den­tro des­sas classes.”
“Ao invés de im­ple­men­tar todos os com­por­ta­men­tos por conta pró­pria, o ob­jeto ori­gi­nal, cha­mado con­texto, ar­ma­zena uma re­fe­rên­cia para um dos ob­je­tos de es­tado que re­pre­senta seu es­tado atual, e de­lega todo o tra­ba­lho re­la­ci­o­nado aos es­ta­dos para aquele objeto.”
“Essa es­tru­tura pode ser pa­re­cida com o pa­drão Stra­tegy, mas há uma di­fe­rença chave. No pa­drão State, os es­ta­dos em par­ti­cu­lar podem estar ci­en­tes de cada um e ini­ciar tran­si­ções de um es­tado para outro, en­quanto que es­tra­té­gias quase nunca sabem sobre as ou­tras estratégias.”

“Uti­lize o pa­drão State quando você tem um ob­jeto que se com­porta de ma­neira di­fe­rente de­pen­dendo do seu es­tado atual, quando o nú­mero de es­ta­dos é enorme, e quando o có­digo es­tado es­pe­cí­fico muda com frequência.”

“Uti­lize o pa­drão quando você tem uma classe po­pu­lada com con­di­ci­o­nais gi­gan­tes que al­te­ram como a classe se com­porta de acordo com os va­lo­res atu­ais dos cam­pos da classe.”

