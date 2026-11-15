// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09109 dut (
    .clk(clk),
    .L_1(in_vec[19:15]),
    .L_2(in_vec[14:10]),
    .L_3(in_vec[9:5]),
    .L_4(in_vec[4:0]),
    .segment_out(out_vec[11:8]),
    .seg_um(out_vec[7:7]),
    .seg_ul(out_vec[6:6]),
    .seg_ur(out_vec[5:5]),
    .seg_mm(out_vec[4:4]),
    .seg_dl(out_vec[3:3]),
    .seg_dr(out_vec[2:2]),
    .seg_dm(out_vec[1:1]),
    .seg_dot(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h6cd69;
    stim[1] = 20'hcc0d3;
    stim[2] = 20'h791db;
    stim[3] = 20'hc3c8d;
    stim[4] = 20'ha720e;
    stim[5] = 20'h77c63;
    stim[6] = 20'hb4746;
    stim[7] = 20'h91ba5;
    stim[8] = 20'ha9383;
    stim[9] = 20'hb6239;
    stim[10] = 20'h3422f;
    stim[11] = 20'h01445;
    stim[12] = 20'h32a36;
    stim[13] = 20'h43360;
    stim[14] = 20'h24959;
    stim[15] = 20'hbbfd6;
    stim[16] = 20'h900f7;
    stim[17] = 20'hf2aca;
    stim[18] = 20'hd8468;
    stim[19] = 20'h86b2e;
    stim[20] = 20'h15c25;
    stim[21] = 20'haf627;
    stim[22] = 20'h5b5ea;
    stim[23] = 20'h71af3;
    stim[24] = 20'h8c09f;
    stim[25] = 20'h84bbc;
    stim[26] = 20'h8d530;
    stim[27] = 20'h3be44;
    stim[28] = 20'h374ab;
    stim[29] = 20'h67d96;
    stim[30] = 20'h4939e;
    stim[31] = 20'h58197;
    stim[32] = 20'h9964f;
    stim[33] = 20'hcb809;
    stim[34] = 20'ha9453;
    stim[35] = 20'hbd0dc;
    stim[36] = 20'h27edd;
    stim[37] = 20'h0df49;
    stim[38] = 20'ha528c;
    stim[39] = 20'h100ff;
    stim[40] = 20'he58cb;
    stim[41] = 20'h2eb77;
    stim[42] = 20'hb2b11;
    stim[43] = 20'h533e5;
    stim[44] = 20'h570a9;
    stim[45] = 20'hc1ce9;
    stim[46] = 20'h10da9;
    stim[47] = 20'h46856;
    stim[48] = 20'h9fe21;
    stim[49] = 20'h47fd3;
    stim[50] = 20'h5ee05;
    stim[51] = 20'h7cfaa;
    stim[52] = 20'ha1455;
    stim[53] = 20'h3616b;
    stim[54] = 20'hc94bc;
    stim[55] = 20'h24be6;
    stim[56] = 20'h2c134;
    stim[57] = 20'h42744;
    stim[58] = 20'h74033;
    stim[59] = 20'hf3f39;
    stim[60] = 20'h80de6;
    stim[61] = 20'h4aeef;
    stim[62] = 20'h73bb8;
    stim[63] = 20'hbe84f;
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
      expv[0] = 12'heff;
      expv[1] = 12'hd48;
      expv[2] = 12'hb21;
      expv[3] = 12'h77e;
      expv[4] = 12'he00;
      expv[5] = 12'hdde;
      expv[6] = 12'hb49;
      expv[7] = 12'h721;
      expv[8] = 12'he44;
      expv[9] = 12'hd8b;
      expv[10] = 12'hbda;
      expv[11] = 12'h7ff;
      expv[12] = 12'he11;
      expv[13] = 12'hdef;
      expv[14] = 12'hb7e;
      expv[15] = 12'h708;
      expv[16] = 12'he5a;
      expv[17] = 12'hd11;
      expv[18] = 12'hb20;
      expv[19] = 12'h701;
      expv[20] = 12'he10;
      expv[21] = 12'hd5a;
      expv[22] = 12'hbda;
      expv[23] = 12'h7ef;
      expv[24] = 12'hebf;
      expv[25] = 12'hd10;
      expv[26] = 12'hbee;
      expv[27] = 12'h710;
      expv[28] = 12'he5b;
      expv[29] = 12'hdee;
      expv[30] = 12'hbdf;
      expv[31] = 12'h7be;
      expv[32] = 12'he7f;
      expv[33] = 12'hd29;
      expv[34] = 12'hb11;
      expv[35] = 12'h748;
      expv[36] = 12'he5a;
      expv[37] = 12'hdfe;
      expv[38] = 12'hbee;
      expv[39] = 12'h7df;
      expv[40] = 12'he45;
      expv[41] = 12'hd20;
      expv[42] = 12'hb7e;
      expv[43] = 12'h7da;
      expv[44] = 12'heef;
      expv[45] = 12'hdde;
      expv[46] = 12'hb5b;
      expv[47] = 12'h709;
      expv[48] = 12'he01;
      expv[49] = 12'hdfe;
      expv[50] = 12'hbbe;
      expv[51] = 12'h729;
      expv[52] = 12'heff;
      expv[53] = 12'hd29;
      expv[54] = 12'hb7f;
      expv[55] = 12'h7de;
      expv[56] = 12'he8b;
      expv[57] = 12'hd10;
      expv[58] = 12'hbee;
      expv[59] = 12'h748;
      expv[60] = 12'hebe;
      expv[61] = 12'hd49;
      expv[62] = 12'hb5a;
      expv[63] = 12'h700;
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
