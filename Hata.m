function Lp = Hata(f,ht,hr,d)
Ch = (1.1 * log10(f) - 0.7) * hr - (1.56*log10(f)-0.8);
a = 69.55 + 26.16*log10(f) - 13.82*log10(ht) - Ch;
b = 44.9 - 6.55*log10(ht);
Lp = a + b*log10(d);