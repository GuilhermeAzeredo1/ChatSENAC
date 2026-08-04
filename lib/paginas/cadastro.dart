import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Tópico 1: Rolagem e margens nas bordas
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

              // Logo e Nome do App
              const SizedBox(height: 32), // Tópico 3
              // Títulos
              Text("Cadastrar-se", style: Tipografia.h1),
              const SizedBox(height: 12), // Tópico 3
              Text(
                "Crie uma conta para continuar!",
                style: Tipografia.subtitulo,
              ),
              const SizedBox(height: 32), // Tópico 3
              // Campo de Nome
              Text("Nome"),
              const SizedBox(height: 4), // Tópico 3
              TextField(
                // Tópico 4: Estilização do input
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

              const SizedBox(height: 20), // Tópico 3
              // Campo de Email
              Text("Email"),
              const SizedBox(height: 4), // Tópico 3
              TextField(
                // Tópico 4: Estilização do input
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

              const SizedBox(height: 19), // Tópico 3
              // Campo de Senha
              Text("Senha"),
              const SizedBox(height: 4), // Tópico 3
              TextField(
                // Tópico 5: Oculta a senha
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.visibility_off),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20), // Tópico 3
              // Campo de Confirmar Senha
              Text("Confirmar Senha"),
              const SizedBox(height: 4), // Tópico 3
              TextField(
                // Tópico 5: Oculta a senha
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.visibility_off),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 30), // Tópico 3

              const SizedBox(height: 24), // Tópico 3
              // Botão Entrar Principal
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
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
              const SizedBox(height: 16), // Tópico 3

              const SizedBox(height: 16), // Tópico 3

              const SizedBox(height: 54), // Tópico 3
            ],
          ),
        ),
      ),
    );
  }
}
