// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  compressor_32 dut (
    .a(in_vec[23:16]),
    .b(in_vec[15:8]),
    .c(in_vec[7:0]),
    .s(out_vec[15:8]),
    .ca(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h986d70;
    stim[1] = 24'hb8cbd2;
    stim[2] = 24'h163ee1;
    stim[3] = 24'h6d429d;
    stim[4] = 24'h60a90f;
    stim[5] = 24'hbd1d50;
    stim[6] = 24'hacbaf9;
    stim[7] = 24'h0c0e87;
    stim[8] = 24'h46693d;
    stim[9] = 24'h54e9a3;
    stim[10] = 24'h8290ff;
    stim[11] = 24'h6c01a6;
    stim[12] = 24'h67647f;
    stim[13] = 24'h53a905;
    stim[14] = 24'h00d9c3;
    stim[15] = 24'h8a9f62;
    stim[16] = 24'h1250d2;
    stim[17] = 24'h3a4fd8;
    stim[18] = 24'hcdb909;
    stim[19] = 24'h95bba0;
    stim[20] = 24'h810c5c;
    stim[21] = 24'hda9a0c;
    stim[22] = 24'h1c7b33;
    stim[23] = 24'h7086aa;
    stim[24] = 24'h785b5e;
    stim[25] = 24'he23f2e;
    stim[26] = 24'h956e91;
    stim[27] = 24'h3f0148;
    stim[28] = 24'h148cce;
    stim[29] = 24'hf2a86d;
    stim[30] = 24'hbed449;
    stim[31] = 24'h19167a;
    stim[32] = 24'hc6f82b;
    stim[33] = 24'h325eaa;
    stim[34] = 24'hdbe796;
    stim[35] = 24'h225846;
    stim[36] = 24'h91ebf0;
    stim[37] = 24'hb454a8;
    stim[38] = 24'h326d31;
    stim[39] = 24'hc45ac8;
    stim[40] = 24'h73f392;
    stim[41] = 24'ha8b7a1;
    stim[42] = 24'h113d33;
    stim[43] = 24'h57ed38;
    stim[44] = 24'ha444df;
    stim[45] = 24'hdbfc6b;
    stim[46] = 24'h721184;
    stim[47] = 24'h54143b;
    stim[48] = 24'h97c9ed;
    stim[49] = 24'he2ecfb;
    stim[50] = 24'hbd9bcd;
    stim[51] = 24'hb85fc6;
    stim[52] = 24'hed53f6;
    stim[53] = 24'h68a2cc;
    stim[54] = 24'h973382;
    stim[55] = 24'hd029c3;
    stim[56] = 24'he1acd7;
    stim[57] = 24'hd4655a;
    stim[58] = 24'h36090e;
    stim[59] = 24'h17ec42;
    stim[60] = 24'hcc6fb0;
    stim[61] = 24'h6f98a5;
    stim[62] = 24'h8d480a;
    stim[63] = 24'hfbeec8;
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
      expv[0] = 16'h8578;
      expv[1] = 16'ha1da;
      expv[2] = 16'hc936;
      expv[3] = 16'hb24d;
      expv[4] = 16'hc629;
      expv[5] = 16'hf01d;
      expv[6] = 16'hefb8;
      expv[7] = 16'h850e;
      expv[8] = 16'h126d;
      expv[9] = 16'h1ee1;
      expv[10] = 16'hed92;
      expv[11] = 16'hcb24;
      expv[12] = 16'h7c67;
      expv[13] = 16'hff01;
      expv[14] = 16'h1ac1;
      expv[15] = 16'h778a;
      expv[16] = 16'h9052;
      expv[17] = 16'had5a;
      expv[18] = 16'h7d89;
      expv[19] = 16'h8eb1;
      expv[20] = 16'hd10c;
      expv[21] = 16'h4c9a;
      expv[22] = 16'h543b;
      expv[23] = 16'h5ca2;
      expv[24] = 16'h7d5a;
      expv[25] = 16'hf32e;
      expv[26] = 16'h6a95;
      expv[27] = 16'h7609;
      expv[28] = 16'h568c;
      expv[29] = 16'h37e8;
      expv[30] = 16'h23dc;
      expv[31] = 16'h751a;
      expv[32] = 16'h15ea;
      expv[33] = 16'hc63a;
      expv[34] = 16'haad7;
      expv[35] = 16'h3c42;
      expv[36] = 16'h8af1;
      expv[37] = 16'h48b4;
      expv[38] = 16'h6e31;
      expv[39] = 16'h56c8;
      expv[40] = 16'h12f3;
      expv[41] = 16'hbea1;
      expv[42] = 16'h1f31;
      expv[43] = 16'h827d;
      expv[44] = 16'h3fc4;
      expv[45] = 16'h4cfb;
      expv[46] = 16'he710;
      expv[47] = 16'h7b14;
      expv[48] = 16'hb3cd;
      expv[49] = 16'hf5ea;
      expv[50] = 16'heb9d;
      expv[51] = 16'h21de;
      expv[52] = 16'h48f7;
      expv[53] = 16'h06e8;
      expv[54] = 16'h2693;
      expv[55] = 16'h3ac1;
      expv[56] = 16'h9ae5;
      expv[57] = 16'heb54;
      expv[58] = 16'h310e;
      expv[59] = 16'hb946;
      expv[60] = 16'h13ec;
      expv[61] = 16'h52ad;
      expv[62] = 16'hcf08;
      expv[63] = 16'hddea;
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
