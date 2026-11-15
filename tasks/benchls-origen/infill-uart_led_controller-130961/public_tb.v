// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130961 dut (
    .clk(clk),
    .rst(in_vec[15:15]),
    .btnu(in_vec[14:14]),
    .btnl(in_vec[13:13]),
    .btnd(in_vec[12:12]),
    .btnr(in_vec[11:11]),
    .btnc(in_vec[10:10]),
    .sw(in_vec[9:2]),
    .uart_rxd(in_vec[1:1]),
    .uart_cts(in_vec[0:0]),
    .uart_txd(out_vec[9:9]),
    .led(out_vec[8:1]),
    .uart_rts(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'he075;
    stim[1] = 16'haeab;
    stim[2] = 16'h13ca;
    stim[3] = 16'h1464;
    stim[4] = 16'h4f49;
    stim[5] = 16'h52af;
    stim[6] = 16'h4bb4;
    stim[7] = 16'h224e;
    stim[8] = 16'h707d;
    stim[9] = 16'h7d78;
    stim[10] = 16'h1cb2;
    stim[11] = 16'h589c;
    stim[12] = 16'h0417;
    stim[13] = 16'h794f;
    stim[14] = 16'h02bc;
    stim[15] = 16'h57ef;
    stim[16] = 16'h62d1;
    stim[17] = 16'h24e5;
    stim[18] = 16'h024d;
    stim[19] = 16'h2334;
    stim[20] = 16'h6451;
    stim[21] = 16'h780d;
    stim[22] = 16'h7b63;
    stim[23] = 16'h3b4e;
    stim[24] = 16'h46a2;
    stim[25] = 16'hae24;
    stim[26] = 16'h7189;
    stim[27] = 16'h50be;
    stim[28] = 16'h46e9;
    stim[29] = 16'h6c39;
    stim[30] = 16'h5b13;
    stim[31] = 16'h6f5a;
    stim[32] = 16'h41e2;
    stim[33] = 16'h3282;
    stim[34] = 16'h2275;
    stim[35] = 16'h061b;
    stim[36] = 16'h296b;
    stim[37] = 16'h64b7;
    stim[38] = 16'h76df;
    stim[39] = 16'h3da8;
    stim[40] = 16'h66a3;
    stim[41] = 16'h415e;
    stim[42] = 16'h3099;
    stim[43] = 16'h28f2;
    stim[44] = 16'h4628;
    stim[45] = 16'h7642;
    stim[46] = 16'h4621;
    stim[47] = 16'h5bf1;
    stim[48] = 16'h632d;
    stim[49] = 16'h0bd3;
    stim[50] = 16'h4d64;
    stim[51] = 16'h36b6;
    stim[52] = 16'h592c;
    stim[53] = 16'h6fd2;
    stim[54] = 16'h1254;
    stim[55] = 16'h7507;
    stim[56] = 16'h1933;
    stim[57] = 16'h0e1e;
    stim[58] = 16'h7256;
    stim[59] = 16'h42dd;
    stim[60] = 16'h2326;
    stim[61] = 16'h1e14;
    stim[62] = 16'h7e9f;
    stim[63] = 16'h80f8;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hx00;
      expv[2] = 10'hx00;
      expv[3] = 10'hx00;
      expv[4] = 10'hx32;
      expv[5] = 10'hxa5;
      expv[6] = 10'hxa5;
      expv[7] = 10'hxa5;
      expv[8] = 10'hxa5;
      expv[9] = 10'hxa5;
      expv[10] = 10'hxbd;
      expv[11] = 10'hx58;
      expv[12] = 10'hx59;
      expv[13] = 10'hx0b;
      expv[14] = 10'hx0b;
      expv[15] = 10'hx0b;
      expv[16] = 10'hxf7;
      expv[17] = 10'hxf7;
      expv[18] = 10'hx73;
      expv[19] = 10'hx73;
      expv[20] = 10'hx73;
      expv[21] = 10'hx29;
      expv[22] = 10'hx29;
      expv[23] = 10'hx29;
      expv[24] = 10'hx28;
      expv[25] = 10'hx51;
      expv[26] = 10'hx00;
      expv[27] = 10'hx01;
      expv[28] = 10'hx01;
      expv[29] = 10'hx75;
      expv[30] = 10'hx1d;
      expv[31] = 10'hx1d;
      expv[32] = 10'hxad;
      expv[33] = 10'hxad;
      expv[34] = 10'hxac;
      expv[35] = 10'hxac;
      expv[36] = 10'hx0c;
      expv[37] = 10'hx0c;
      expv[38] = 10'hx5b;
      expv[39] = 10'hx6f;
      expv[40] = 10'hxd4;
      expv[41] = 10'hx51;
      expv[42] = 10'hx51;
      expv[43] = 10'hx50;
      expv[44] = 10'hx50;
      expv[45] = 10'hx15;
      expv[46] = 10'hx21;
      expv[47] = 10'hx11;
      expv[48] = 10'hx11;
      expv[49] = 10'hx11;
      expv[50] = 10'hx11;
      expv[51] = 10'hxb3;
      expv[52] = 10'hx5a;
      expv[53] = 10'hx5b;
      expv[54] = 10'hxe9;
      expv[55] = 10'hxe8;
      expv[56] = 10'hx83;
      expv[57] = 10'hx82;
      expv[58] = 10'hx0e;
      expv[59] = 10'hx0f;
      expv[60] = 10'hx0f;
      expv[61] = 10'hx0f;
      expv[62] = 10'hx0a;
      expv[63] = 10'hx4f;
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
