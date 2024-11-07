// Fungsi untuk Menghitung KPK

int gcd(int a, int b) {
  // Fungsi untuk menghitung GCD (Greatest Common Divisor) menggunakan algoritma Euclidean
  return b == 0 ? a : gcd(b, a % b);
}

int lcm(int a, int b) {
  // KPK (LCM) dari dua bilangan
  return (a * b) ~/ gcd(a, b);
}

void main() {
  int num1 = 12;
  int num2 = 8;

  print("Bilangan 1: $num1");
  print("Bilangan 2: $num2");
  print("KPK $num1 dan $num2 = ${lcm(num1, num2)}");
}
