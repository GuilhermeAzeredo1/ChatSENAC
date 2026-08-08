import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';
import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nomeControlador = TextEditingController();
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();
  final confirmarSenhaControlador = TextEditingController();

  bool isSenhaObscure = true;
  bool isConfirmarSenhaObscure = true;

  void trocarSenhaObscure() {
    setState(() {
      isSenhaObscure = !isSenhaObscure;
    });
  }

  void trocarConfirmarSenhaObscure() {
    setState(() {
      isConfirmarSenhaObscure = !isConfirmarSenhaObscure;
    });
  }

  Icon getSenhaInvisivel() {
    if (isSenhaObscure) {
      return const Icon(Icons.visibility_off);
    }

    return const Icon(Icons.visibility);
  }

  Icon getConfirmarSenhaInvisivel() {
    if (isConfirmarSenhaObscure) {
      return const Icon(Icons.visibility_off);
    }

    return const Icon(Icons.visibility);
  }

  Future fazerCadastro() async {
    if (senhaControlador.text != confirmarSenhaControlador.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("As senhas não são iguais.")),
      );

      return;
    }

    var url = Uri.http("10.112.4.33", "api/cadastro");

    var resposta = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nome": nomeControlador.text,
        "email": emailControlador.text,
        "senha": senhaControlador.text,
      }),
    );

    if (resposta.statusCode != 200 && resposta.statusCode != 201) {
      var dados = jsonDecode(resposta.body);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${dados["message"]}")));

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Cadastro realizado com sucesso!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Títulos
              Text("Cadastrar-se", style: Tipografia.h1),

              const SizedBox(height: 12),

              Text(
                "Crie uma conta para continuar!",
                style: Tipografia.subtitulo,
              ),

              const SizedBox(height: 32),

              // Campo de Nome
              const Text("Nome"),

              const SizedBox(height: 4),

              TextField(
                controller: nomeControlador,
                decoration: InputDecoration(
                  hintText: "Seu nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Campo de Email
              const Text("Email"),

              const SizedBox(height: 4),

              TextField(
                controller: emailControlador,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "exemplo@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 19),

              // Campo de Senha
              const Text("Senha"),

              const SizedBox(height: 4),

              TextField(
                controller: senhaControlador,
                obscureText: isSenhaObscure,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: trocarSenhaObscure,
                    icon: getSenhaInvisivel(),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Campo de Confirmar Senha
              const Text("Confirmar Senha"),

              const SizedBox(height: 4),

              TextField(
                controller: confirmarSenhaControlador,
                obscureText: isConfirmarSenhaObscure,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: trocarConfirmarSenhaObscure,
                    icon: getConfirmarSenhaInvisivel(),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const SizedBox(height: 24),

              // Botão Entrar Principal
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: fazerCadastro,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Registrar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 16),

              const SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}
