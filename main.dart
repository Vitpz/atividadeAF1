// Avaliação Formativa I - Programação para Dispositivos Móveis
// SkyHorizon Airlines
// Aluno: Vitor Paz

class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

class Passagem {
  String? _codigoLocalizador = '';
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // Exercício 2 - Construtor não nomeado.
  Passagem();

  // Exercício 3 - Construtores nomeados.
  Passagem.somenteCodigo(String codigoLocalizador)
      : _codigoLocalizador = codigoLocalizador;

  Passagem.completa(
    String? codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes,
  )   : _codigoLocalizador = codigoLocalizador,
        passageiro = passageiro,
        plataforma = plataforma,
        atendente = atendente,
        observacoes = observacoes;

  // Exercício 4 - Parâmetros nomeados.
  Passagem.codigoEPassageiro({
    String? codigoLocalizador,
    this.passageiro,
  }) : _codigoLocalizador = codigoLocalizador;

  Passagem.all(
    String? codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
    this.observacoes,
  }) : _codigoLocalizador = codigoLocalizador;

  // Exercício 5 - Getter e setter tradicionais.
  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }

    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 6 - Getter e setter nativos do Dart.
  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }

    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 7 - Métodos de negócio.
  void EmitirPassagem() {
    print('Passagem emitida com sucesso!');
  }

  bool CancelarPassagem() {
    print('Passagem cancelada com sucesso!');
    return true;
  }

  void AtualizarPassagem() {
    print('Passagem atualizada com sucesso!');
  }

  Passagem ConsultarPassagem(String codigo) {
    print('Passagem consultada com sucesso!');
    return Passagem();
  }
}

// Exercício 9 - Mixins.
mixin Logger {
  void log(String mensagem) {
    print('[Log]: $mensagem');
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print('[Auditoria]: $mensagem');
  }
}

// Exercício 8 - Herança + Exercício 9 - Mixins.
class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  PassagemPrimeiraClasse(
    String? codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes, {
    required this.loungeAcesso,
  }) : super.all(
          codigoLocalizador,
          passageiro: passageiro,
          plataforma: plataforma,
          atendente: atendente,
          observacoes: observacoes,
        );

  // Exercício 10 - Sobrescrita polimórfica.
  @override
  void AtualizarPassagem() {
    print('Passagem de Primeira Classe atualizada com sucesso!');
    log('Alteração realizada pelo atendente: ${atendente?.nome}');
    auditar('Verificação de segurança realizada para a Primeira Classe.');
  }
}

void main() {
  print('=== SkyHorizon Airlines ===');
  print('Demonstração da Avaliação Formativa I\n');

  // Dados de apoio.
  final passageiro = Passageiro()
    ..nome = 'Lucas Almeida'
    ..cpf = '123.456.789-00'
    ..rg = '12.345.678-9'
    ..email = 'lucas@email.com'
    ..celular = '(11) 99999-9999';

  final plataforma = PlataformaVenda()
    ..codigoCanal = 101
    ..nomeCanal = 'Site SkyHorizon';

  final atendente = Atendente()
    ..nome = 'Marina Costa'
    ..matricula = 'AT2026'
    ..cargo = 'Atendente'
    ..email = 'marina@skyhorizon.com'
    ..celular = '(11) 98888-8888'
    ..salario = 3200.00;

  // Exercício 2 - Instância com construtor não nomeado.
  final passagemPadrao = Passagem();
  passagemPadrao.passageiro = passageiro;
  passagemPadrao.plataforma = plataforma;
  passagemPadrao.atendente = atendente;
  passagemPadrao.observacoes = 'Passagem criada pelo atendimento.';
  passagemPadrao.codigoLocalizador = 'SH20260001';

  print('--- Passagem padrão ---');
  print('Localizador: ${passagemPadrao.codigoLocalizador}');
  passagemPadrao.EmitirPassagem();
  passagemPadrao.AtualizarPassagem();

  // Exercício 3 - Construtores somenteCodigo e completa.
  final passagemCodigo = Passagem.somenteCodigo('SH20260002');
  print('\n--- Somente código ---');
  print('Localizador: ${passagemCodigo.codigoLocalizador}');

  final passagemCompleta = Passagem.completa(
    'SH20260003',
    passageiro,
    plataforma,
    atendente,
    'Cliente solicitou janela.',
  );
  print('\n--- Passagem completa ---');
  print('Localizador: ${passagemCompleta.codigoLocalizador}');
  print('Passageiro: ${passagemCompleta.passageiro?.nome}');
  print('Plataforma: ${passagemCompleta.plataforma?.nomeCanal}');
  print('Atendente: ${passagemCompleta.atendente?.nome}');

  // Exercício 4 - Construtores com parâmetros nomeados.
  final passagemCodigoEPassageiro = Passagem.codigoEPassageiro(
    codigoLocalizador: 'SH20260004',
    passageiro: passageiro,
  );

  final passagemAll = Passagem.all(
    'SH20260005',
    passageiro: passageiro,
    plataforma: plataforma,
    atendente: atendente,
    observacoes: 'Reserva feita pelo canal parceiro.',
  );

  print('\n--- Parâmetros nomeados ---');
  print(
    'Código e passageiro: ${passagemCodigoEPassageiro.codigoLocalizador}',
  );
  print('Construtor all: ${passagemAll.codigoLocalizador}');

  // Exercícios 5 e 6 - Encapsulamento e validação.
  print('\n--- Encapsulamento e validação ---');
  passagemAll.setCodigoLocalizador('SH20260006');
  print('Getter tradicional: ${passagemAll.getCodigoLocalizador()}');
  passagemAll.setCodigoLocalizador('');
  passagemAll.codigoLocalizador = null;
  passagemAll.codigoLocalizador = 'SH20260007';
  print('Getter nativo: ${passagemAll.codigoLocalizador}');

  // Exercício 7 - Métodos operacionais.
  print('\n--- Operações de passagem ---');
  passagemAll.EmitirPassagem();
  passagemAll.AtualizarPassagem();
  final cancelada = passagemAll.CancelarPassagem();
  print('Cancelamento confirmado: $cancelada');
  passagemAll.ConsultarPassagem('SH20260007');

  // Exercícios 8, 9 e 10 - Herança, mixins e polimorfismo.
  final passagemVip = PassagemPrimeiraClasse(
    'VIP20260001',
    passageiro,
    plataforma,
    atendente,
    'Cliente com acesso prioritário.',
    loungeAcesso: 'Sky Premium Lounge',
  );

  print('\n--- Primeira Classe ---');
  print('Localizador: ${passagemVip.codigoLocalizador}');
  print('Lounge: ${passagemVip.loungeAcesso}');
  passagemVip.EmitirPassagem();
  passagemVip.AtualizarPassagem();

  // Demonstração do polimorfismo.
  print('\n--- Polimorfismo ---');
  Passagem passagemPolimorfica = passagemVip;
  passagemPolimorfica.AtualizarPassagem();

  print('\n=== Demonstração finalizada ===');
}
