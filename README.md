# Planning 
	- Answer questions
	- Users Stories
	- Model Our Data
	- Think Through the pages need in our app

# Questions
	1. What are we building?
	2. Who are we building it for?
	3. What features do we want to have?

	1. Controle de contas para uma lanchonete. Um lugar onde o dono poderá gerenciar suas
	   contas de maneira rápida e simples. 
	2. Para o dono de uma lanchonete
	3. Funcionalidades:
		- User, sign in / out
		- autenticação para apenas o dono acessar o sistema
		- CRUD(Create, Read, Update & Destroy) para Clientes, Contas, PagamentoEmDinheiro e Compras 
		- Aplicação rodando no Heroku


# User Stories
	- O sistema contém dois tipos de usuários(admin, normal_user)
	- Normal_user: pode cadastrar, exibir e editar(customers, accounts, cashPayments)
	- Admin: pode fazer tudo que o normal_user faz e ainda tem a opção do CRUD para purchases e consultar o profit, além de um dashboard para manipular todos os dados do sistema
	- Na aba profit o admin pode consultar dados como o totalDeVendas(totalSales), totalArrecadado(totalCollected) que implica no tanto de dinheiro sem ser fiado arrecadado, total de fiado(totalSpun) que implica no montante de dinheiro fiado que foi vendido na data informada e por fim o total de compras(totalPurchases) que verifica se o admin fez alguma reposição de mantimentos durante a data informada
	- Ainda na aba profit, a data informada pode ser um dia, semana, mês ou até mesmo um ano.

# Data(relationships)
	**Customer**
	has_many :accounts
		- name
		- email
		- phone
		- created_at
		- update_at

	**Account**
	belongs_to :customer
		- price
		- salesman
		- description
		- status
		- created_at
		- updated_at

	**CashPayment**
		- salesman
		- price
		- description
		- created_at
		- updated_at

	**Purchase**
		- price
		- description
		- created_at
		- updated_at
	**Profit**
		- option
		- date

# Pages
	- Welcome page(welcome#index)
	- Sign In(session#new)
	- Sign Out(session#destroy)

	- Customers(customer#index)
	- Customer Single(customer#show)
	- Customer Edit(customer#edit)
	- Customer New(customer#new)

	- Accounts(account#index)
	- Account single(account#show)
	- Account Edit(account#edit)
	- Account New(account#new)

	- Cash Payment(cash_payment#new)
	- Cash Payment Single(cash_payment#show)
	- Cash Payment(cash_payment#edit)
	- Cash Payments(cash_payment#index)

	- Purchases(purchase#index)
	- Purchase(purchase#new)
	- Purchase Edit(purchase#edit)
	- Purchase Single(purchase#show)

	-Profits(profit#index)
	-Profit(profit#show)





