// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169451 dut (
    .afl(in_vec[63:32]),
    .bfl(in_vec[31:0]),
    .fl(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h2ccfab52ea63e2b0;
    stim[1] = 64'hc80064781f4215e7;
    stim[2] = 64'h11a56d218d4e6b49;
    stim[3] = 64'hdc17afd81358b537;
    stim[4] = 64'hf0e33026ac1c5047;
    stim[5] = 64'h292aff1d2313dd6d;
    stim[6] = 64'ha659be6bfa20e4ca;
    stim[7] = 64'hcae7d1dd00328a56;
    stim[8] = 64'h757fb8d4cf9251cf;
    stim[9] = 64'h09fdcc8014736049;
    stim[10] = 64'h68edb014cf44656d;
    stim[11] = 64'hbd5153d77ff295f3;
    stim[12] = 64'h406ed910761db25f;
    stim[13] = 64'hcd9cdf7de3ce9ffa;
    stim[14] = 64'h08d6ba09cac651fb;
    stim[15] = 64'hf5be7107f1ffaa79;
    stim[16] = 64'hbea96a89444af47f;
    stim[17] = 64'h3a836f89789adc90;
    stim[18] = 64'ha40c273709544828;
    stim[19] = 64'h0c36bb37242e2913;
    stim[20] = 64'h68bb22dc8dd9dc9f;
    stim[21] = 64'h891f08a6ee2d6594;
    stim[22] = 64'h698a92f63adde749;
    stim[23] = 64'h1128684706041cc0;
    stim[24] = 64'h97b1661a914baa2c;
    stim[25] = 64'hb112217ea173c59e;
    stim[26] = 64'hc03983c1af0afae1;
    stim[27] = 64'h4a12ba5363649343;
    stim[28] = 64'h5fe3a46c3233f9d2;
    stim[29] = 64'h025138ee7c3f100c;
    stim[30] = 64'h238fc91cc4b6e648;
    stim[31] = 64'h444a50b62e6c82cf;
    stim[32] = 64'he436382fe5b37005;
    stim[33] = 64'h5707aa2e68d36e62;
    stim[34] = 64'he07daf13dad3604f;
    stim[35] = 64'h8c080eca2bf07326;
    stim[36] = 64'h637fc262e51e01ca;
    stim[37] = 64'h969ce277a1f5442c;
    stim[38] = 64'h35bf750ede313a7f;
    stim[39] = 64'hddd27a72f9b8c73e;
    stim[40] = 64'hd8864bb9b9c58f67;
    stim[41] = 64'hde2b3f2c77818975;
    stim[42] = 64'h7bf287edcdf218df;
    stim[43] = 64'h7ed67d7b106c9fe6;
    stim[44] = 64'hc0d9664492f13d0e;
    stim[45] = 64'h1e915ba3b9c20120;
    stim[46] = 64'hf160399c075997b6;
    stim[47] = 64'hdec2cecaf597d59d;
    stim[48] = 64'ha9c2f816d5bd3ae5;
    stim[49] = 64'ha986bc17721fa4db;
    stim[50] = 64'h7d70b1a57bec8e25;
    stim[51] = 64'h813a3480939d3276;
    stim[52] = 64'he1566d1f412441a8;
    stim[53] = 64'h988f1c5da524a1cc;
    stim[54] = 64'h5562d2e0148ddfd9;
    stim[55] = 64'had014da295155eed;
    stim[56] = 64'hf8286c272e57469f;
    stim[57] = 64'ha75c18372b4d24a1;
    stim[58] = 64'hf174b27fea9b0d1d;
    stim[59] = 64'h4d5fd71c697c5bed;
    stim[60] = 64'ha29f7c38e569cdfe;
    stim[61] = 64'hf86375f20e61c871;
    stim[62] = 64'h24d1c6e1940fb796;
    stim[63] = 64'h98a5a7f286c3d8ab;
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
      expv[0] = 32'hd73e2b99;
      expv[1] = 32'ha78033df;
      expv[2] = 32'hdf16edde;
      expv[3] = 32'haf906a6d;
      expv[4] = 32'h5d15f0bd;
      expv[5] = 32'h0c86ac3f;
      expv[6] = 32'h60971003;
      expv[7] = 32'h8b28fe2e;
      expv[8] = 32'h8512479f;
      expv[9] = 32'h5e71645c;
      expv[10] = 32'hf83a9c74;
      expv[11] = 32'hfd48cdf1;
      expv[12] = 32'h7699b7a5;
      expv[13] = 32'h7191bc46;
      expv[14] = 32'h93afa548;
      expv[15] = 32'h27be474e;
      expv[16] = 32'hc31840b3;
      expv[17] = 32'h7380b893;
      expv[18] = 32'hed880095;
      expv[19] = 32'h7093bcd7;
      expv[20] = 32'hb6a9842a;
      expv[21] = 32'h378b01ab;
      expv[22] = 32'h6487c1e1;
      expv[23] = 32'h57814c55;
      expv[24] = 32'h691d337f;
      expv[25] = 32'h12906615;
      expv[26] = 32'h2f84ef05;
      expv[27] = 32'h6d8eb71c;
      expv[28] = 32'h522875fc;
      expv[29] = 32'h3ea80433;
      expv[30] = 32'ha886c53e;
      expv[31] = 32'h32bf000b;
      expv[32] = 32'h0a15c9d6;
      expv[33] = 32'h0004fef5;
      expv[34] = 32'h7b51de17;
      expv[35] = 32'hf8071430;
      expv[36] = 32'h889df358;
      expv[37] = 32'h789a7663;
      expv[38] = 32'hd41867cf;
      expv[39] = 32'h17a495f4;
      expv[40] = 32'h52836bdf;
      expv[41] = 32'h960084ef;
      expv[42] = 32'h89e61750;
      expv[43] = 32'h4f4965eb;
      expv[44] = 32'h13cf16ec;
      expv[45] = 32'h9888f367;
      expv[46] = 32'hb8c35a1b;
      expv[47] = 32'h148c70a6;
      expv[48] = 32'h3fa0090a;
      expv[49] = 32'hdc01aa3a;
      expv[50] = 32'h395f9308;
      expv[51] = 32'h550d46d7;
      expv[52] = 32'he2987b05;
      expv[53] = 32'h7e045313;
      expv[54] = 32'h2a0ab63d;
      expv[55] = 32'h028037b4;
      expv[56] = 32'he69b8fcf;
      expv[57] = 32'h92b780eb;
      expv[58] = 32'h1c18a99b;
      expv[59] = 32'h76dd1d37;
      expv[60] = 32'h481a0691;
      expv[61] = 32'hc6cbfb21;
      expv[62] = 32'hf90a0a98;
      expv[63] = 32'h5f93f5a6;
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
