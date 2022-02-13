import 'dart:math';

hajm() {
  kore_hajm() {
    double kore_hajm_r = 3;
    double kore_hajm_pi = pi;
    double kore_hajm_r3 = kore_hajm_r * kore_hajm_r * kore_hajm_r;
    double kore_hajm_V = 4 / 3 * kore_hajm_pi * kore_hajm_r3;
    print("hajme kore : ");
    print(kore_hajm_V);
    //az haminja ta akhar hame print ha bara debuge
  }

  heram_hajm() {
    double heram_hajm_B = 4;
    //B= masahate ghaede
    double heram_hajm_h = 3;
    double heram_hajm_V = 1 / 3 * heram_hajm_B * heram_hajm_h;
    print("hajme heram :");
    print(heram_hajm_V);
  }

  ostovane_hajm() {
    double ostovane_hajm_pi = pi;
    double ostovane_hajm_r = 2;
    double ostovane_hajm_r2 = ostovane_hajm_r * ostovane_hajm_r;
    double ostovane_hajm_h = 5;
    double ostovane_V = ostovane_hajm_pi * ostovane_hajm_r2 * ostovane_hajm_h;
    print("hajme ostovane:");
    print(ostovane_V);
  }

  manshoor_hajm() {
    double manshoor_hajm_B = 9;
    double manshoor_hajm_h = 10;
    double manshoor_hajm_V = manshoor_hajm_B * manshoor_hajm_h;
    print("hajme manshoor : ");
    print(manshoor_hajm_V);
  }

  makhroot_hajm() {
    double makhroot_hajm_pi = pi;
    double makhroot_hajm_r = 3;
    double makhroot_hajm_r2 = makhroot_hajm_r * makhroot_hajm_r;
    double makhroot_hajm_h = 10;
    double makhroot_hajm_V =
        1 / 3 * makhroot_hajm_pi * makhroot_hajm_r2 * makhroot_hajm_h;
    print("hajme makhroot");
    print(makhroot_hajm_V);
  }

  mokab_hajm() {
    double mokab_hajm_a = 2;
    double mokab_hajm_V = mokab_hajm_a * mokab_hajm_a * mokab_hajm_a;
    print("hajme moka'ab :");
    print(mokab_hajm_V);
  }

  mokabmostatil_hajm() {
    double mokabmostatil_hajm_a = 1;
    double mokabmostatil_hajm_b = 2;
    double mokabmostatil_hajm_c = 3;
    double mokabmostatil_hajm_V =
        mokabmostatil_hajm_a * mokabmostatil_hajm_b * mokabmostatil_hajm_c;
    print("hajme moka'ab mostatil:");
    print(mokabmostatil_hajm_V);
  }

  motvazialsotooh_hajm() {
    double motvazi_hajm_a = 2;
    double motvazi_hajm_b = 3;
    double motvazi_hajm_c = 4;
    double motvazi_hajm_alfa = 60;
    double motvazi_hajm_beta = 30;
    double motvazi_hajm_gama = 120;
    //adad ha delkhahan . rasti hatman inu too net search kon kheyli jozam dare
    //ye vakh gir nakoni to voroodia
    double motvazi_hajm_alfa_rad = motvazi_hajm_alfa * pi / 180;
    double motvazi_hajm_beta_rad = motvazi_hajm_beta * pi / 180;
    double motvazi_hajm_gama_rad = motvazi_hajm_gama * pi / 180;
    //adad haye in balaiye  delkhah nist va formoole
    double motvazi_hajm_alfa_cos = cos(motvazi_hajm_alfa_rad);
    double motvazi_hajm_beta_cos = cos(motvazi_hajm_beta_rad);
    double motvazi_hajm_gama_cos = cos(motvazi_hajm_gama_rad);
    double motvazi_hajm_alfa_cos2 =
        motvazi_hajm_alfa_cos * motvazi_hajm_alfa_cos;
    double motvazi_hajm_beta_cos2 =
        motvazi_hajm_beta_cos * motvazi_hajm_beta_cos;
    double motvazi_hajm_gama_cos2 =
        motvazi_hajm_gama_cos * motvazi_hajm_gama_cos;
    double K = 1 +
        2 *
            motvazi_hajm_alfa_cos *
            motvazi_hajm_beta_cos *
            motvazi_hajm_gama_cos -
        motvazi_hajm_alfa_cos2 -
        motvazi_hajm_beta_cos2 -
        motvazi_hajm_gama_cos2;

    double morvazi_hajm_radicalK = sqrt(K);
    double motvazi_hajm_V = motvazi_hajm_a *
        motvazi_hajm_b *
        motvazi_hajm_c *
        morvazi_hajm_radicalK;
    print("hajme motevazi al sotooh :");
    print(motvazi_hajm_V);
  }

  chanbare_hajm() {
    double chanbare_hajm_R = 5;
    double chanbare_hajm_r = 3;
    double chanbare_hajm_r2 = chanbare_hajm_r * chanbare_hajm_r;
    double chanbare_hajm_pi = pi;
    double chanbare_hajm_pi2 = chanbare_hajm_pi * chanbare_hajm_pi;
    double chanbare_hajm_V =
        2 * chanbare_hajm_pi2 * chanbare_hajm_R * chanbare_hajm_r2;
    print('hajme chanbare : ');
    print(chanbare_hajm_V);
  }

  beyzigoon_hajm() {
    double beyzigoon_hajm_a = 3;
    double beyzigoon_hajm_b = 5;
    double beyzigoon_hajm_c = 10;
    double beyzigoon_hajm_pi = pi;
    double beyzigoon_hajm_V = beyzigoon_hajm_a *
        beyzigoon_hajm_b *
        beyzigoon_hajm_c *
        beyzigoon_hajm_pi;
    print("hajme beyzi goon: ");
    print(beyzigoon_hajm_V);
  }

  charavajhi_hajm() {
    //حجم چهار وجهی منتظمه چون زیاد میشد اینطوریش کردم
    double charavajhi_hajm_a = 4;
    double charavajhi_hajm_a3 =
        charavajhi_hajm_a * charavajhi_hajm_a * charavajhi_hajm_a;
    double charavajhi_hajm_radical2 = sqrt(2);
    double charavajhi_hajm_1 = charavajhi_hajm_radical2 / 12;
    double charavajhi_hajm_V = charavajhi_hajm_1 * charavajhi_hajm_a3;
    print("hajme chaharvajhiye montazam : ");
    print(charavajhi_hajm_V);
  }

  kore_hajm();
  heram_hajm();
  ostovane_hajm();
  manshoor_hajm();
  makhroot_hajm();
  mokab_hajm();
  mokabmostatil_hajm();
  motvazialsotooh_hajm();
  chanbare_hajm();
  beyzigoon_hajm();
  charavajhi_hajm();
}

main() {
  hajm();
}
