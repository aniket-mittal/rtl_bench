// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_126816 dut (
    .clk(clk),
    .a(in_vec[39:24]),
    .b(in_vec[23:8]),
    .ctrl(in_vec[7:0]),
    .out(out_vec[19:4]),
    .n(out_vec[3:3]),
    .z(out_vec[2:2]),
    .c(out_vec[1:1]),
    .v(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h068494f4f5;
    stim[1] = 40'ha84a686aac;
    stim[2] = 40'he459686c34;
    stim[3] = 40'h76bfe26af5;
    stim[4] = 40'h39e4b19ccc;
    stim[5] = 40'hd89e806ed3;
    stim[6] = 40'h381e412e42;
    stim[7] = 40'hfbf831f31c;
    stim[8] = 40'hd3ad2a8525;
    stim[9] = 40'h6653cc3937;
    stim[10] = 40'h63f66cf817;
    stim[11] = 40'h3e17db2ddb;
    stim[12] = 40'he172a45875;
    stim[13] = 40'h31ba90f706;
    stim[14] = 40'hc092dab2c6;
    stim[15] = 40'h06f65b4975;
    stim[16] = 40'h466c4023ea;
    stim[17] = 40'h6902e1be2e;
    stim[18] = 40'h61362e881d;
    stim[19] = 40'h7f3abaa4c8;
    stim[20] = 40'h338fb6a051;
    stim[21] = 40'hef7f93785e;
    stim[22] = 40'h2ee47ceccf;
    stim[23] = 40'h96009dd085;
    stim[24] = 40'h6fec81b7f9;
    stim[25] = 40'h4ae17b414c;
    stim[26] = 40'heecfb1677a;
    stim[27] = 40'h75147dbcd6;
    stim[28] = 40'hab0d4ef126;
    stim[29] = 40'hdd98155f28;
    stim[30] = 40'h9fc137a146;
    stim[31] = 40'hebd12c51bc;
    stim[32] = 40'h8a1e7d079d;
    stim[33] = 40'h5de94c47b0;
    stim[34] = 40'h862dc75649;
    stim[35] = 40'hf14551a79a;
    stim[36] = 40'h8c8c34db76;
    stim[37] = 40'h88e91660cc;
    stim[38] = 40'hd30367cb35;
    stim[39] = 40'h7d34f4602d;
    stim[40] = 40'h167f18ddbc;
    stim[41] = 40'h4ddf0296c3;
    stim[42] = 40'h77030654f3;
    stim[43] = 40'h546a6709c9;
    stim[44] = 40'hfe0612cc87;
    stim[45] = 40'hb7e019d1f5;
    stim[46] = 40'hfa7ddcb515;
    stim[47] = 40'hfb0a7be4da;
    stim[48] = 40'h188cb06a2e;
    stim[49] = 40'h257d35d946;
    stim[50] = 40'h0c30d186f5;
    stim[51] = 40'h03fcfab1cb;
    stim[52] = 40'h1135568174;
    stim[53] = 40'ha07e314c91;
    stim[54] = 40'hf0ca27a906;
    stim[55] = 40'h66686fba2b;
    stim[56] = 40'h244cf3f6ff;
    stim[57] = 40'h5854910e68;
    stim[58] = 40'h859ba3c2da;
    stim[59] = 40'h615af0b340;
    stim[60] = 40'hd1d25af99b;
    stim[61] = 40'hf552887f64;
    stim[62] = 40'h68e91e4923;
    stim[63] = 40'h0903fda301;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 20'hxxxxx;
      expv[1] = 20'h6840x;
      expv[2] = 20'h00010;
      expv[3] = 20'h00010;
      expv[4] = 20'hfc000;
      expv[5] = 20'h00008;
      expv[6] = 20'h58304;
      expv[7] = 20'h794c0;
      expv[8] = 20'h00010;
      expv[9] = 20'h75a00;
      expv[10] = 20'h00330;
      expv[11] = 20'h00630;
      expv[12] = 20'h62ea2;
      expv[13] = 20'h72000;
      expv[14] = 20'h00630;
      expv[15] = 20'h30240;
      expv[16] = 20'hec000;
      expv[17] = 20'h868f9;
      expv[18] = 20'h00018;
      expv[19] = 20'h36000;
      expv[20] = 20'h3a200;
      expv[21] = 20'hb7af0;
      expv[22] = 20'h00ef8;
      expv[23] = 20'h00020;
      expv[24] = 20'h96000;
      expv[25] = 20'hefff8;
      expv[26] = 20'h00018;
      expv[27] = 20'ha0363;
      expv[28] = 20'h00078;
      expv[29] = 20'h55860;
      expv[30] = 20'h15180;
      expv[31] = 20'h4fe00;
      expv[32] = 20'h00010;
      expv[33] = 20'h0f000;
      expv[34] = 20'h4c410;
      expv[35] = 20'hc77f0;
      expv[36] = 20'h42eca;
      expv[37] = 20'h00110;
      expv[38] = 20'h00010;
      expv[39] = 20'h18000;
      expv[40] = 20'h7d340;
      expv[41] = 20'h00010;
      expv[42] = 20'h4b490;
      expv[43] = 20'h70af0;
      expv[44] = 20'h776b0;
      expv[45] = 20'hffff0;
      expv[46] = 20'h6fc08;
      expv[47] = 20'h4fa00;
      expv[48] = 20'h76ee2;
      expv[49] = 20'h00060;
      expv[50] = 20'h00120;
      expv[51] = 20'h0c000;
      expv[52] = 20'h094b2;
      expv[53] = 20'h00010;
      expv[54] = 20'hb17e0;
      expv[55] = 20'h00788;
      expv[56] = 20'hf6ae2;
      expv[57] = 20'h00918;
      expv[58] = 20'h10040;
      expv[59] = 20'h295d3;
      expv[60] = 20'h60120;
      expv[61] = 20'h76d91;
      expv[62] = 20'h00000;
      expv[63] = 20'h4aa04;
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
