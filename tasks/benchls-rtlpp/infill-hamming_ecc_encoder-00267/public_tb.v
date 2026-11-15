// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00267 dut (
    .din(in_vec[59:0]),
    .dout(out_vec[67:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'hc69a6328b09eeec;
    stim[1] = 60'hf65d23b93901102;
    stim[2] = 60'h202b914d96b415d;
    stim[3] = 60'h2ff484a7d7fa45d;
    stim[4] = 60'h35ddee2d26f18c0;
    stim[5] = 60'h94346e136eb4f86;
    stim[6] = 60'hf5b9f29631540b8;
    stim[7] = 60'h0be9d4a200070ab;
    stim[8] = 60'hb37252d4091b11a;
    stim[9] = 60'hed39627211ad136;
    stim[10] = 60'h50efa6df40ff06a;
    stim[11] = 60'ha02564660a7201c;
    stim[12] = 60'h4237ddd5123af60;
    stim[13] = 60'h2a12d8f5c3337fa;
    stim[14] = 60'hb6502d9cc7dc858;
    stim[15] = 60'hd5bbd917810d1ea;
    stim[16] = 60'h33e9f3b90c602ba;
    stim[17] = 60'h44ad0f2dea38f02;
    stim[18] = 60'hd1c9ff9d624b09b;
    stim[19] = 60'h918796a5762776f;
    stim[20] = 60'h18fe68609b655ee;
    stim[21] = 60'h9e18bb3beaa33fb;
    stim[22] = 60'h93b60b6137414db;
    stim[23] = 60'hc83fd1ada550466;
    stim[24] = 60'h0178cc870ac59d4;
    stim[25] = 60'hb3a32bf0d71d383;
    stim[26] = 60'h350018126dc3d7e;
    stim[27] = 60'h2bb546c8c8865d7;
    stim[28] = 60'hfc5329ae019acc4;
    stim[29] = 60'h97c267eea227fb6;
    stim[30] = 60'h1436e5bdce24929;
    stim[31] = 60'h995f64cb3ed7977;
    stim[32] = 60'hc48b3909fbadc9a;
    stim[33] = 60'h8edee969019ea72;
    stim[34] = 60'haf7fd6dcc6505bb;
    stim[35] = 60'hba8133d236a309c;
    stim[36] = 60'h0218da8ed2c6558;
    stim[37] = 60'hc782d08e7d1f8de;
    stim[38] = 60'h39716667484978f;
    stim[39] = 60'h1c990068c6690fb;
    stim[40] = 60'h1476554c70e2b97;
    stim[41] = 60'h01f1793fcd387df;
    stim[42] = 60'h3642b739f6bab07;
    stim[43] = 60'h0ca0c361cfbc6c7;
    stim[44] = 60'hbb084c8dcca52fb;
    stim[45] = 60'h790732a44179e3e;
    stim[46] = 60'hb66d77bd1b97312;
    stim[47] = 60'h4efcf960f7901ad;
    stim[48] = 60'hb4e383b3bca3258;
    stim[49] = 60'hb203211cc7dc845;
    stim[50] = 60'hb2e299a6c66c194;
    stim[51] = 60'h2f9942fc3754919;
    stim[52] = 60'h94d2c2050e7ec57;
    stim[53] = 60'h7545356e3924549;
    stim[54] = 60'h1dd77acf08e45cf;
    stim[55] = 60'hb3de161999efc3a;
    stim[56] = 60'h0992eb7c78090bd;
    stim[57] = 60'h192ad1607e19e87;
    stim[58] = 60'hdd6e259c8c0e578;
    stim[59] = 60'h3f84c9e41df5d01;
    stim[60] = 60'ha84c5a38ad0b40d;
    stim[61] = 60'h5e9f2ed57b7ad8c;
    stim[62] = 60'h8420bd1a52a27e2;
    stim[63] = 60'h645fe3135c96e8f;
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
      expv[0] = 68'hc69a6328b09eeec7d;
      expv[1] = 68'hf65d23b939011024e;
      expv[2] = 68'h202b914d96b415dd7;
      expv[3] = 68'h2ff484a7d7fa45d49;
      expv[4] = 68'h35ddee2d26f18c062;
      expv[5] = 68'h94346e136eb4f8681;
      expv[6] = 68'hf5b9f29631540b863;
      expv[7] = 68'h0be9d4a200070ab23;
      expv[8] = 68'hb37252d4091b11aac;
      expv[9] = 68'hed39627211ad13667;
      expv[10] = 68'h50efa6df40ff06a26;
      expv[11] = 68'ha02564660a7201cf7;
      expv[12] = 68'h4237ddd5123af6055;
      expv[13] = 68'h2a12d8f5c3337fac9;
      expv[14] = 68'hb6502d9cc7dc85838;
      expv[15] = 68'hd5bbd917810d1eaa4;
      expv[16] = 68'h33e9f3b90c602ba30;
      expv[17] = 68'h44ad0f2dea38f026c;
      expv[18] = 68'hd1c9ff9d624b09b67;
      expv[19] = 68'h918796a5762776f01;
      expv[20] = 68'h18fe68609b655ee26;
      expv[21] = 68'h9e18bb3beaa33fb50;
      expv[22] = 68'h93b60b6137414db25;
      expv[23] = 68'hc83fd1ada550466f1;
      expv[24] = 68'h0178cc870ac59d413;
      expv[25] = 68'hb3a32bf0d71d3835f;
      expv[26] = 68'h350018126dc3d7e50;
      expv[27] = 68'h2bb546c8c8865d7f7;
      expv[28] = 68'hfc5329ae019acc427;
      expv[29] = 68'h97c267eea227fb631;
      expv[30] = 68'h1436e5bdce249298f;
      expv[31] = 68'h995f64cb3ed797789;
      expv[32] = 68'hc48b3909fbadc9a07;
      expv[33] = 68'h8edee969019ea720d;
      expv[34] = 68'haf7fd6dcc6505bb61;
      expv[35] = 68'hba8133d236a309ca2;
      expv[36] = 68'h0218da8ed2c6558a7;
      expv[37] = 68'hc782d08e7d1f8de12;
      expv[38] = 68'h39716667484978f4e;
      expv[39] = 68'h1c990068c6690fb67;
      expv[40] = 68'h1476554c70e2b974f;
      expv[41] = 68'h01f1793fcd387df62;
      expv[42] = 68'h3642b739f6bab0738;
      expv[43] = 68'h0ca0c361cfbc6c7df;
      expv[44] = 68'hbb084c8dcca52fbdb;
      expv[45] = 68'h790732a44179e3ec4;
      expv[46] = 68'hb66d77bd1b97312a1;
      expv[47] = 68'h4efcf960f7901adfe;
      expv[48] = 68'hb4e383b3bca3258d1;
      expv[49] = 68'hb203211cc7dc84520;
      expv[50] = 68'hb2e299a6c66c19466;
      expv[51] = 68'h2f9942fc3754919d8;
      expv[52] = 68'h94d2c2050e7ec57f6;
      expv[53] = 68'h7545356e39245494b;
      expv[54] = 68'h1dd77acf08e45cf22;
      expv[55] = 68'hb3de161999efc3aac;
      expv[56] = 68'h0992eb7c78090bda0;
      expv[57] = 68'h192ad1607e19e8763;
      expv[58] = 68'hdd6e259c8c0e57859;
      expv[59] = 68'h3f84c9e41df5d0150;
      expv[60] = 68'ha84c5a38ad0b40d76;
      expv[61] = 68'h5e9f2ed57b7ad8c1f;
      expv[62] = 68'h8420bd1a52a27e2df;
      expv[63] = 68'h645fe3135c96e8f64;
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
