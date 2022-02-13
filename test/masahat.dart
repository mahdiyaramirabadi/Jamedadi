import 'dart:math';

masahat() {
  //agha in mas hamoon masahate dige
  mosalas_motesavi_mas() {
    double mosalas_motesavi_mas_s = 5;
    num mosalas_motesavi_mas_s2 = pow(mosalas_motesavi_mas_s, 2);
    double mosalas_motesavi_mas_A = 1 / 4 * sqrt(3) * mosalas_motesavi_mas_s2;
    print("masahate moslase motesavi al azla : ");
    print(mosalas_motesavi_mas_A);
  }

  mosalas_mohit_va_zel_mas() {
    double mosalas_mohit_va_zel_mas_s = 5;
    double mosalas_mohit_va_zel_mas_a = 4;
    double mosalas_mohit_va_zel_mas_b = 4;
    double mosalas_mohit_va_zel_mas_c = 2;
    double mosalas_mohit_va_zel_mas_ebarat = mosalas_mohit_va_zel_mas_s *
        (mosalas_mohit_va_zel_mas_s - mosalas_mohit_va_zel_mas_a) *
        (mosalas_mohit_va_zel_mas_s - mosalas_mohit_va_zel_mas_b) *
        (mosalas_mohit_va_zel_mas_s - mosalas_mohit_va_zel_mas_c);
    double mosalas_mohit_va_zel_mas_A = sqrt(mosalas_mohit_va_zel_mas_ebarat);
    print("masahte mosalas , hengami ke se zel va mohit ra darim : ");
    print(mosalas_mohit_va_zel_mas_A);
  }

  mosalas_do_zel_va_zaviye_mas() {
    double mosalas_do_zel_va_zaviye_mas_a = 3;
    double mosalas_do_zel_va_zaviye_mas_b = 3;
    double mosalas_do_zel_va_zaviye_mas_C = 120;
    double mosalas_do_zel_va_zaviye_mas_rad_C =
        mosalas_do_zel_va_zaviye_mas_C * pi / 180;
    double mosalas_do_zel_va_zaviye_mas_C_sin =
        sin(mosalas_do_zel_va_zaviye_mas_rad_C);
    double mosalas_do_zel_va_zaviye_mas_A = 1 /
        2 *
        mosalas_do_zel_va_zaviye_mas_a *
        mosalas_do_zel_va_zaviye_mas_b *
        mosalas_do_zel_va_zaviye_mas_C_sin;
    print("masahate mosalas vaghti do zel va zaviye beyn ra darim : ");
    print(mosalas_do_zel_va_zaviye_mas_A);
  }

  mosalas_ertefa_ghaede_mas() {
    double mosalas_ertefa_ghaede_mas_b = 3;
    double mosalas_ertefa_ghaede_mas_h = 4;
    double mosalas_ertefa_ghaede_mas_A =
        1 / 2 * mosalas_ertefa_ghaede_mas_b * mosalas_ertefa_ghaede_mas_h;
    print("masahat mosalas vaghti ertefa , ghaede ra dashte bashim : ");
    print(mosalas_ertefa_ghaede_mas_A);
  }

  moraba_mas() {
    double moraba_mas_s = 2;
    double moraba_mas_A = moraba_mas_s * moraba_mas_s;
    print("masahate moraba");
    print(moraba_mas_A);
  }

  mostatil_mas() {
    double mostatil_mas_l = 3;
    double mostatil_mas_w = 2;
    double mostatil_mas_A = mostatil_mas_l * mostatil_mas_w;
    print("masahate mostatil : ");
    print(mostatil_mas_A);
  }

  lozi_mas() {
    double lozi_mas_a = 3;
    double lozi_mas_b = 4;
    double lozi_mas_A = 1 / 2 * lozi_mas_a * lozi_mas_b;
    print("lozi");
    print(lozi_mas_A);
  }

  motezaialazla_mas() {
    double motezaialazla_mas_b = 3;
    double motezaialazla_mas_h = 1;
    double motezaialazla_mas_A = motezaialazla_mas_b * motezaialazla_mas_h;
    print("motezaialazla:");
    print(motezaialazla_mas_A);
  }

  zooznanghe_mas() {
    double zooznanghe_mas_a = 3;
    double zooznanghe_mas_b = 1;
    double zooznanghe_mas_h = 2;
    double zooznanghe_mas_A =
        1 / 2 * (zooznanghe_mas_a * zooznanghe_mas_b) * zooznanghe_mas_h;
    print("zoozanghe : ");
    print(zooznanghe_mas_A);
  }

  zeli6_montazam_mas() {
    double zeli6_montazam_mas_s = 5;
    num zeli6_montazam_mas_s2 = pow(zeli6_montazam_mas_s, 2);
    double zeli6_montazam_mas_A = 3 / 2 * sqrt(3) * zeli6_montazam_mas_s2;
    print("zeli6_montazam_mas :");
    print(zeli6_montazam_mas_A);
  }

  zeli8_montazam_mas() {
    double zeli8_montazam_mas_s = 3;
    double zeli8_montazam_mas_s2 = zeli8_montazam_mas_s * zeli8_montazam_mas_s;
    double zeli8_montazam_mas_A = 2 * (1 + sqrt(2)) * zeli8_montazam_mas_s2;
    print("zeli8_montazam_mas");
    print(zeli8_montazam_mas_A);
  }

  chanzeli_motazam_mas() {
    double chanzeli_motazam_mas_s = 4;
    double chanzeli_motazam_mas_s2 =
        chanzeli_motazam_mas_s * chanzeli_motazam_mas_s;
    double chanzeli_motazam_mas_n = 5;
    double chanzeli_motazam_mas_soorat =
        chanzeli_motazam_mas_n * chanzeli_motazam_mas_s2;
    double chanzeli_motazam_mas_makhraj = 4 * tan(pi / chanzeli_motazam_mas_n);
    double chanzeli_motazam_mas_A =
        chanzeli_motazam_mas_soorat / chanzeli_motazam_mas_makhraj;
    print('chanzeli_motazam_mas');
    print(chanzeli_motazam_mas_A);
  }

  chanzeli_motazam_mas_shoaye_dayeere_mohit() {
    double chanzeli_motazam_mas_shoaye_dayeere_mohit_a = 3;
    double chanzeli_motazam_mas_shoaye_dayeere_mohit_p = 4;
    double chanzeli_motazam_mas_shoaye_dayeere_mohit_A = 1 /
        2 *
        chanzeli_motazam_mas_shoaye_dayeere_mohit_a *
        chanzeli_motazam_mas_shoaye_dayeere_mohit_p;
    print('chanzeli_motazam_mas_shoaye_dayeere_mohit');
    print(chanzeli_motazam_mas_shoaye_dayeere_mohit_A);
  }

  dayere_mas() {
    double dayere_mas_r = 5;
    num dayere_mas_A = pi * pow(dayere_mas_r, 2);
    print('dayere_mas');
    print(dayere_mas_A);
  }

  ghetae_dayere_mas() {
    double ghetae_dayere_mas_r = 3;
    double ghetae_dayere_mas_zaviye = 1;
    //zaviye bar hasb radian
    num ghetae_dayere_mas_A =
        1 / 2 * pow(ghetae_dayere_mas_r, 2) * ghetae_dayere_mas_zaviye;
    print('ghetae_dayere_mas');
    print(ghetae_dayere_mas_A);
  }

  beyzi_mas() {
    double beyzi_mas_a = 3;
    double beyzi_mas_b = 4;
    double beyzi_mas_A = beyzi_mas_a * beyzi_mas_b * pi;
    print("beyzi_mas");
    print(beyzi_mas_A);
  }

  ostovane_mas() {
    double ostovane_mas_r = 3;
    double ostovane_mas_h = 5;
    double ostovane_mas_kol_A =
        2 * pi * ostovane_mas_r * (ostovane_mas_r + ostovane_mas_h);
    double ostovane_mas_janebi_A = 2 * pi * ostovane_mas_r * ostovane_mas_h;
    print("ostovane_mas_kol");
    print(ostovane_mas_kol_A);
    print('ostovane_mas_janebi');
    print(ostovane_mas_janebi_A);
  }

  makhroot_mas() {
    double makhroot_mas_r = 3;
    double makhroot_mas_h = 4;
    num makhroot_mas_l = sqrt(pow(makhroot_mas_r, 2) + pow(makhroot_mas_h, 2));
    double makhroot_mas_A_kol =
        pi * makhroot_mas_r * (makhroot_mas_r + makhroot_mas_l);
    double makhroot_mas_A_janebi = pi * makhroot_mas_r * makhroot_mas_l;
    print("makhroot_mas_kol");
    print(makhroot_mas_A_kol);
    print('makhroot_mas_janebi');
    print(makhroot_mas_A_janebi);
  }

  kore_mas() {
    double kore_mas_d = 6;
    double kore_mas_d2 = kore_mas_d * kore_mas_d;
    double kore_mas_A = pi * kore_mas_d2;
    print("kore_mas");
    print(kore_mas_A);
  }

  heram_mas() {
    double heram_mas_B = 4;
    double heram_mas_P = 3;
    double heram_mas_L = 2;
    double heram_mas_A = heram_mas_B + heram_mas_P * heram_mas_L / 2;
    print("heram_mas");
    print(heram_mas_A);
  }

  mosalas_motesavi_mas();
  mosalas_mohit_va_zel_mas();
  mosalas_do_zel_va_zaviye_mas();
  mosalas_ertefa_ghaede_mas();
  moraba_mas();
  mostatil_mas();
  lozi_mas();
  motezaialazla_mas();
  zooznanghe_mas();
  zeli6_montazam_mas();
  zeli8_montazam_mas();
  chanzeli_motazam_mas();
  chanzeli_motazam_mas_shoaye_dayeere_mohit();
  dayere_mas();
  ghetae_dayere_mas();
  beyzi_mas();
  ostovane_mas();
  makhroot_mas();
  kore_mas();
  heram_mas();
}

main() {
  masahat();
}
