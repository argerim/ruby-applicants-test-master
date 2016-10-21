# Teste Ruby para Candidatos

## Resumo

O objetivo da aplicação é consultar marcas e modelos de carros usando a API do WebMotors.

## Objetivo

1. Faça um fork do projeto;
2. Execute o rails server;
3. Verifique o funcionamento da aplicação;
4. Abra o código e faça uma análise para uma melhor compreensão;
5. Utilize seu conhecimento em Ruby/Rails e Orientação a Objetos para fazer todas as possíveis mudanças que julgar pertinente: classes, métodos, variáveis e boas práticas.

Obs: todo o cuidado e rigor adicional serão contados como pontos positivos.

##Minhas modificações

Atualização para a versão mais recente do rails 5.0.0.1
Atualização do html e css para usar Bootstrap
Modificação nos nomes dos controllers e models
Adição de index, validações para tabelas e models
Criação de uma classe para acesso ao webservice
Criação de classes para atualização dos models brand e car_model

##Refatorado controllers, models, views e adição de teste automatizado com:
- rspec
- capybara
- database cleaner
- shoulda matchers
- e vcr

Modificado o bando de dados para Postgresql
Com a atualização para rails 5 o sistema ganhou puma conseguentemente

##Algumas observações

A principio é cabivel colocar um nivel de cache na aplicação para evitar tanto ir ao webservice, como a parte do banco de dados.
Não é algo de outro mundo, mas por ser somente um teste, gostaria de deixar claro que é possivel implementar.
A aplicação segue o fluxo determinado antes das minhas modificações, seleciona o fabrincate e logo em seguinda a exibiçao dos modelos.

Todo o fluxo de popular e atualizar as tabelas foi colocado em background com um tempo de 10 em 10 minutos, podendo ser mudando facilmente no arquivo config/clockwork.rb.
Optei por isso por verificar no desenvolvimento que os dados não atualizavam com frequencia.

##Para executar o sistema faça as seguintes instruções:
- adicionar/modificar o arquivo config/database.yml para o banco Postgresql
- rails db:create
- rails db:migrate
- bundle exec sidekiq -C config/sidekiq.yml
- bundle exec clockwork config/clockwork.rb
- rails s
- abrir browser e colocar na barra de endereços: http://localhost:3000

Os testes automatizados como descrito anteriormente podem ser executados com o comando abaixo
rspec spec/