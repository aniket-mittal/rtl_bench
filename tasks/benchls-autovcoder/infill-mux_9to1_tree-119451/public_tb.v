// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 144;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119451 dut (
    .din0(in_vec[143:128]),
    .din1(in_vec[127:112]),
    .din2(in_vec[111:96]),
    .din3(in_vec[95:80]),
    .din4(in_vec[79:64]),
    .din5(in_vec[63:48]),
    .din6(in_vec[47:32]),
    .din7(in_vec[31:16]),
    .din8(in_vec[15:0]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 144'h76a4ee4d5749fa72a7e76c34902d838468fe;
    stim[1] = 144'h6dadd68c879000d8d5382990da0629199f52;
    stim[2] = 144'hbd2a6d952cd789847da1feadb3d2fc9ca8e8;
    stim[3] = 144'h73f90d0bdfdc407e3aae4ef3e264c4508ee4;
    stim[4] = 144'h97e334512f95d77a0a598793ad29f1b25ac2;
    stim[5] = 144'hd91d330b35c80167230da3fa5c798d06efe8;
    stim[6] = 144'hd9f6f064d0134aa3b30538a3187e60b53d03;
    stim[7] = 144'h4a2ea894d98045068e8aef48257e90f048af;
    stim[8] = 144'h21908da2004caccd276d3bc33d6f842f9ab8;
    stim[9] = 144'hb5ffe6bda4a5abb7c8a44e51bb6ee2344096;
    stim[10] = 144'h93c824eb7e083a33b9fe5a5ec47fc4cbfd3b;
    stim[11] = 144'hcf8b503b1f2b32341bba44b695a39b90d031;
    stim[12] = 144'hf2ae93644ad63e6370fa66453ce76344a8f9;
    stim[13] = 144'h41ed068cc64e44a63f29a81730ab1564217b;
    stim[14] = 144'h23e55a6604c54ba7c60538fcd2496a9871c6;
    stim[15] = 144'h9de8b1953fb7a13b39e9d9a871a3d8d6b781;
    stim[16] = 144'h6340eb8f9a7dbf830778600dc2924261721d;
    stim[17] = 144'hed5d39c1aea07abb520e0f509d4c66dba07c;
    stim[18] = 144'hd237c8c0fc7793936e335da37bd31bd2f795;
    stim[19] = 144'hedfaf5826c29e07d6077bda6705a502044c8;
    stim[20] = 144'h4baf9ccece143a6574ef7e1b03a29e5c6010;
    stim[21] = 144'h02c365c59fdbd2494a1be7a16a095d6c9d81;
    stim[22] = 144'h263a94bbd84c2160a1a2f2f755d001814f39;
    stim[23] = 144'h0a4a00a9faa497505b3659a69f5c417b2226;
    stim[24] = 144'hbe8a196826663d1c0d52f58dd83966128524;
    stim[25] = 144'hac0a963ec79c6b295217a4522ce6c2b601b6;
    stim[26] = 144'h1870f4d0022d9630207ee812cd560bd864f8;
    stim[27] = 144'h6bdb42d2f9ac70180ce7083234f9a3f05a52;
    stim[28] = 144'hf12594dfb3997daba0767c1ffee823ae9c7b;
    stim[29] = 144'h6583fdeabfdb5b85035132a503e7649d5aa4;
    stim[30] = 144'h62bc6406996f955e0d46c5d6a8de9aff15de;
    stim[31] = 144'h4c37c663fd3fefff2ea2eb8c79b2530e63c8;
    stim[32] = 144'hedd71964ab9bfd2b04dc22caa5029890b4e6;
    stim[33] = 144'hb432e32f0ab78ccee7828fad9245a68beffa;
    stim[34] = 144'hc9ee777e1530785b30953a88bac9fdfc8bc1;
    stim[35] = 144'h186df29301dd4064fd85763b9ca6fb28461f;
    stim[36] = 144'h66073308cc90cd4bd29b921cad894d76c5cd;
    stim[37] = 144'h9976823bc3754118eec8bfef2bc4e6142ed2;
    stim[38] = 144'hae4069ce11236fedef269fb3190cb19fed3f;
    stim[39] = 144'hf284a3db91d9fc6875f28e0518da721532a6;
    stim[40] = 144'h478953ce2638f35fee053b7fff017e632732;
    stim[41] = 144'hb253154d5532518d466a9578126f4e200fa5;
    stim[42] = 144'haa87d98d1079b1bb9ffafd60ddfe455b11e8;
    stim[43] = 144'ha35605d6fa9d10a18d473a1586beac7eaf42;
    stim[44] = 144'hde2895bb8655224703d1c3e9b7f8c3a8cecb;
    stim[45] = 144'h5cf0cf4ab445ae9f252f6e3e76abc998eea6;
    stim[46] = 144'h0f6b94b53dc3278535b656603746340f6b2b;
    stim[47] = 144'h5492ab9a38eb36ce8b00bb42cc414cdeb900;
    stim[48] = 144'h28b33cb7d54f9461fbc959cc61bbcb1045bf;
    stim[49] = 144'hf3e50ad7d7826c3c6bf40c1d841375d2ac78;
    stim[50] = 144'h9140a234b46334de710e10568e3798b7eb91;
    stim[51] = 144'he0348a609ae098f924ec237ddd9889a90077;
    stim[52] = 144'h0c75d92f09fd084a9d40eafede9ac9311746;
    stim[53] = 144'hb56fe06bd9d3af63a10cd1e0517a003d77d8;
    stim[54] = 144'haf1c4487c3cc94269e048daadcb2108bbaee;
    stim[55] = 144'h040e736e7c08ce8160432d089f1c8c9c9cc8;
    stim[56] = 144'ha327c73837b962983b069a1bc09ab11b8a7f;
    stim[57] = 144'h1e0b07bbb4e9e5921c6e9b56c0a154a2fce5;
    stim[58] = 144'hd58e03532517ede0837b607aed41437d9d31;
    stim[59] = 144'h561658d93d0826418b7caab174744b75b99e;
    stim[60] = 144'h13dbbf3d8028f4cb3ae2f53e504a6f351ba9;
    stim[61] = 144'h082004c35fe8a04df4d78e59610738ea73d7;
    stim[62] = 144'hb0b1adec6019ae19f0a1dd8f682e10423ec5;
    stim[63] = 144'he4d690364e61224af9d10dada7376c1a0b7e;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'h902d;
      expv[1] = 16'h8790;
      expv[2] = 16'hbd2a;
      expv[3] = 16'h3aae;
      expv[4] = 16'h2f95;
      expv[5] = 16'hd91d;
      expv[6] = 16'h4aa3;
      expv[7] = 16'h90f0;
      expv[8] = 16'h2190;
      expv[9] = 16'hbb6e;
      expv[10] = 16'h3a33;
      expv[11] = 16'h503b;
      expv[12] = 16'h9364;
      expv[13] = 16'h44a6;
      expv[14] = 16'hd249;
      expv[15] = 16'hb195;
      expv[16] = 16'h600d;
      expv[17] = 16'h520e;
      expv[18] = 16'h5da3;
      expv[19] = 16'hedfa;
      expv[20] = 16'h4baf;
      expv[21] = 16'h65c5;
      expv[22] = 16'h94bb;
      expv[23] = 16'h9f5c;
      expv[24] = 16'h0d52;
      expv[25] = 16'h2ce6;
      expv[26] = 16'h1870;
      expv[27] = 16'hf9ac;
      expv[28] = 16'h7dab;
      expv[29] = 16'h0351;
      expv[30] = 16'ha8de;
      expv[31] = 16'h4c37;
      expv[32] = 16'ha502;
      expv[33] = 16'h0ab7;
      expv[34] = 16'h777e;
      expv[35] = 16'hfb28;
      expv[36] = 16'h921c;
      expv[37] = 16'hc375;
      expv[38] = 16'hb19f;
      expv[39] = 16'h18da;
      expv[40] = 16'h2638;
      expv[41] = 16'h9578;
      expv[42] = 16'haa87;
      expv[43] = 16'hfa9d;
      expv[44] = 16'h2247;
      expv[45] = 16'h76ab;
      expv[46] = 16'h2785;
      expv[47] = 16'h5492;
      expv[48] = 16'hcb10;
      expv[49] = 16'hf3e5;
      expv[50] = 16'ha234;
      expv[51] = 16'h89a9;
      expv[52] = 16'hde9a;
      expv[53] = 16'hb56f;
      expv[54] = 16'hdcb2;
      expv[55] = 16'h040e;
      expv[56] = 16'hb11b;
      expv[57] = 16'h9b56;
      expv[58] = 16'h0353;
      expv[59] = 16'h7474;
      expv[60] = 16'hbf3d;
      expv[61] = 16'h38ea;
      expv[62] = 16'hdd8f;
      expv[63] = 16'ha737;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
