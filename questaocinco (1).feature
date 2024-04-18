5 - Crie cenários de teste utilizando BDDs para validar nossa api Raromd  https://raromdb-3c39614e42d4.herokuapp.com/swagger

Regras de negócios: 
Usuário: 
    1. E-mail é único e a senha de cadastro deve ter entre 6 e 12 dígitos 
    2. Existem 3 tipos de usuário. comum, crítico e Admin
    3. Todos os usuários nascem com o tipo "comum", sem permissões especiais
    4. Usuário pode consultar e alterar apenas seus próprios dados, com exceção de usuários admin que podem alterar dados de qualquer usuário 
    5. Um usuário pode ser promovido à crítico ou a admin sem passar por critérios especiais. 
    6. Um usuário pode inativar sua própria conta 
    7. Um administrador pode excluir definitivamente uma conta 
    8. Usuário, independente do tipo, pode criar uma review de um filme que esteja cadastrado. 
    9. Se um usuário submeter uma nova review para um filme que já avaliou antes, a review original será atualizada. Só existe 1 review de filme por usuário. 
Filme: 
    1. Apenas usuários administradores podem cadastrar filmes 
    2. Apenas usuários administradores podem excluir filmes cadastrados 
    3. A consulta de filmes é aberta para todos, mesmo para usuários não logados
    4. Na consulta detalhada de filme, todas as reviews já feitas devem ser retornadas, incluindo os dados do usuário que criou a avaliação. 

____________________________________
# CONTA 

Funcionalidade: Cadastro de úsuario 
    
    Contexto: Tela de cadastro 

        Cenario: Cadastro realizado com sucesso

            Quando preencher o campo de email com um email único 
            E preencher o campo de senha corretamente (6 caracteres)
            E clicar no botão "Criar conta"
            Entao uma mensagem informando que a conta foi criada com sucesso será exibida
            E serei redirecionado para a tela de login 
            E terei o tipo de conta "COMUM" 


         Cenario: Cadastro não realizado - senha curta demais

            Quando preencher o campo de email com um email único 
            E preencher o campo de senha (5 caracteres)
            E clicar no botão de "Criar conta"
            Entao o campo de senha será destacado em vermelho com uma mensagem de aviso "A senha deverá conter entre 6-12 caracteres" 
            E só após a senha atender aos requisitos que será possível continuar o cadastro.

        Cenario: Cadastro não realizado - email já cadastrado 

            Quando preencher o campo de email com um email que já possui uma conta
            E preencher o campo de senha corretamente (6 caracteres)
            E clicar no botão de "Criar conta"
            Entao o campo de email será destacado em vermelho com uma mensagem de aviso "Este email já está sendo utilizado. Acesse a página de Login"

        Cenario: Cadastro não realizado - email inválido 

            Quando preencher o campo de email incorretamente
            E preencher o campo de senha corretamente (6 caracteres)
            E clicar no botão de "Criar conta"
            Entao o campo de email será destacado em vermelho com uma mensagem de aviso "Email inválido. Verifique a ortografia e tente novamente"

Funcionalidade: Login 

    Contexto: Tela de login 

        Cenario: Login realizado com sucesso 

            Quando preencher o campo email corretamente
            E preencher o campo de senha corretamente (6 caracteres)
            E clicar no botão "Entrar"
            Entao terei acesso a minha conta 

        Cenario: Login não realizado - senha incorreta 

            Quando preencher o campo email corretamente 
            E preencher o campo senha incorretamente
            E clicar no botão "Entrar"
            Entao receberei um aviso "Senha incorreta. Esqueceu sua senha? Clique aqui!"

        Cenario: Login não realizado - email não cadastrado 

            Quando preencher o campo email 
            E preencher o campo senha 
            E clicar no botão "Entrar"
            Entao receberei um aviso "Não existe nenhuma conta relacionada a este email. Verique a ortografia e tente novamente"

        Cenario: Login não realizado - email inválido 

            Quando preencher o campo de email incorretamente ("Jojoca#.com")
            E preencher a senha com 6 caracteres 
            E clicar no botão de "Entrar"
            Entao o campo de email será destacado em vermelho com uma mensagem de aviso "Email inválido. Verifique a ortografia e tente novamente"

Funcionalidade: Alterar dados da conta 


    Contexto: Sou um úsuario comum e estou na área de configuração de conta.

        Cenario: Desativar conta 

            Quando eu clicar no botão |Desativar conta|
            Entao serei desconectado 
            E receberei um aviso informando que minha conta foi desativada com sucesso

        Cenario: Atualizar email 
            
            Quando eu clicar no botão |Alterar email|
            E informar um email válido 
            E clicar em confirmar 
            Entao terei atualizado meu email com sucesso
            Mas só posso visualizar e atualizar os dados referentes a minha conta.

        Cenario: Atualizar senha 
            
            Quando eu clicar no botão |Alterar senha|
            E informar uma senha nova válida
            E clicar em confirmar 
            Entao terei atualizado minha senha
            Mas só posso visualizar e atualizar os dados referentes a minha conta.


    Contexto: Sou um administrador e estou na área de configuração. 

        Cenario: Promover conta 

            Quando eu clicar em pesquisar usuario
            E digitar o nome do usuario 
            E aparecer o usuario 
            E clicar no icone de configuração de usuario 
            E clicar no campo TIPO DE CONTA 
            E selecionar ADMINISTRADOR 
            Entao terei promovido o usuario a administrador 
            E ele terá acesso a todas funcionalidades de administrador 

        Cenario: Excluir conta 

            Quando eu clicar em pesquisar usuario
            E digitar o nome do usuario 
            E aparecer o usuario 
            E clicar no icone de configuração de usuario 
            E clicar no botão DELETAR CONTA 
            Entao a conta do usuario será deletada 
            E ele não terá mais acesso a plataforma

        Cenario: Alterar email de um usuario 

            Quando eu clicar em pesquisar usuario
            E digitar o nome do usuario 
            E aparecer o usuario 
            E clicar no icone de configuração de usuario 
            E clicar no botão |Alterar email|
            E informar um email válido 
            E clicar em confirmar 
            Entao terei atualizado o email daquele úsuario 
            E ele só podera entrar utilizando o mesmo dali em diante 

         Cenario: Alterar senha de um usuario 

            Quando eu clicar em pesquisar usuario
            E digitar o nome do usuario 
            E aparecer o usuario 
            E clicar no icone de configuração de usuario 
            E clicar no botão |Alterar senha|
            E informar uma senha válida 
            E clicar em confirmar 
            Entao terei atualizado a senha daquele úsuario 
            E ele só podera entrar utilizando a mesma dali em diante 


# FILMES 

Funcionalidade: Cadastro de filmes 

    Contexto: Sou um administrador 

        Cenario: Cadastrar um filme com sucesso

            Quando clico no botão ADICIONAR FILME 
            E preencho os campos (TITULO, GENERO, DESCRIÇÃO, DURAÇÃO, ANO DE LANÇAMENTO) corretamente 
            Entao o filme é cadastrado 
            E os usuarios poderão buscar por ele 
            E criar reviews 

        Cenario: Cadastrar um filme - erro nas informações 

            Quando clico no botão ADICIONAR FILME 
            E preencho os campos (TITULO, GENERO, DESCRIÇÃO, DURAÇÃO) corretamente 
            E preencho o campo (ANO DE LANÇAMENTO) com caracteres especiais #@!@# || texto
            Entao recebo um aviso "As informações não coincidem com o que é pedido nos campos. Verifique e tente novamente"


Funcionalidade: Pesquisar filmes 

    Contexto: Usuarios cadastrados e não cadastrados na tela inicial 
    
        Cenario: Pesquisa realizada com sucesso 

            Quando eu clico no campo pesquisa
            E digito nome de um filme 
            Entao é exibido uma pagina com todas informações do filme (TITULO, GENERO, DESCRIÇÃO, DURAÇÃO, ANO DE LANÇAMENTO)
            E reviews dos úsuarios 

        Cenario: Pesquisa não realizada - filme não encontrado 

            Quando eu clico no campo pesquisa
            E digito nome de um filme erroneamente ("BARTCHIMAN")
            Entao recebo o aviso "Filme não encontrado. Verifique a ortografia e tente novamente"


Funcionalidade: Review do filme 

    Contexto: Usuario não cadastrado na tela de informações do filme X 

        Cenario: Criar um review - não permitido 

            Quando eu clico em Criar Review 
            Entao recebo um aviso "Para criar um review, você deve estar logado. Caso não tenha uma conta, clique aqui e crie a sua!"
            E só após a criação de conta 
            E logar que poderei criar um review 

    Contexto: Usuario cadastrado na tela de informações do filme X 

        Cenario: Criar um review - com sucesso 

            Quando eu clico em Criar Review
            E uma caixa de texto é liberada 
            E eu escrevo a review nela (com no minimo 100 caracteres)
            E clico no botão Publicar review  
            Entao minha review é publicada 
            E ela estara visivel para todos lerem 

        Cenario: Criar um review - erro. review curta demais

            Quando eu clico em Criar Review
            E uma caixa de texto é liberada 
            E eu escrevo a review nela (30 caracteres)
            E clico no botão Publicar review  
            Entao recebo um aviso "A review precisa conter no minimo 100 caracteres" 
            E só após atender os requisitos que poderei publicar a review  

        Cenario: Atualizar uma review 

            Quando eu clico em Criar Review
            E eu já havia escrito uma no passado
            E uma caixa de texto é liberada contendo minha review antiga
            E eu adiciono informações novas
            E clico no botão Publicar review  
            Entao minha review é atualizada 
            E ela estara visivel para todos lerem 






