function out = divergence(I1, I2)

 f1 = intens_frequency(I1);
 f2 = intens_frequency(I2);
 out = sum(f1.*log(f1./f2));
