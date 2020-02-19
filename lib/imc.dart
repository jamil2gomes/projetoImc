class IMC {
  double _altura;
  double _peso;

  IMC(this._altura, this._peso);

  String calcula() {
   double imc =  _peso / (_altura * _altura);

   if(imc < 18.6){
     return '(${imc.toStringAsPrecision(3)} ) Abaixo do peso ';
   }else if (imc >= 18.6 && imc < 24.9) {
     return '(${imc.toStringAsPrecision(3)} ) Peso Ideal';
   }else if (imc >= 24.9 && imc < 29.9){
     return '(${imc.toStringAsPrecision(3)} ) Levemente acima do Peso ';
   }else if (imc >= 29.9 && imc < 34.9){
     return '(${imc.toStringAsPrecision(3)} ) Obesidade Grau I ';
   }else if (imc >= 34.9 && imc < 39.9){
     return '(${imc.toStringAsPrecision(3)} ) Obesidade Grau II ';
   }
     return '(${imc.toStringAsPrecision(3)} ) Tu já ta com as artérias entupidas, mermão';
  }

  @override
  String toString() {
    return "[Imc: $_altura e $_peso]";
  }
}
