// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[26:24]),
    .data0(in_vec[23:20]),
    .data1(in_vec[19:16]),
    .data2(in_vec[15:12]),
    .data3(in_vec[11:8]),
    .data4(in_vec[7:4]),
    .data5(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h0d9d4a2;
    stim[1] = 27'h3d8644f;
    stim[2] = 27'h55176c7;
    stim[3] = 27'h5895abc;
    stim[4] = 27'h1518793;
    stim[5] = 27'h4ee15b5;
    stim[6] = 27'h5316f81;
    stim[7] = 27'h6ea3366;
    stim[8] = 27'h18c8a96;
    stim[9] = 27'h736a7a5;
    stim[10] = 27'h6e965c9;
    stim[11] = 27'h7bec3fc;
    stim[12] = 27'h48e2b05;
    stim[13] = 27'h3b87a0e;
    stim[14] = 27'h7eb1512;
    stim[15] = 27'h0d28045;
    stim[16] = 27'h463826f;
    stim[17] = 27'h77dec05;
    stim[18] = 27'h6a72d75;
    stim[19] = 27'h39afc81;
    stim[20] = 27'h31afc20;
    stim[21] = 27'h3499d09;
    stim[22] = 27'h68df7f4;
    stim[23] = 27'h7472c4a;
    stim[24] = 27'h2e70a9d;
    stim[25] = 27'h4c3dccc;
    stim[26] = 27'h5ced0b9;
    stim[27] = 27'h46c9ab1;
    stim[28] = 27'h4b12ca8;
    stim[29] = 27'h3e52de3;
    stim[30] = 27'h233369f;
    stim[31] = 27'h4dfc327;
    stim[32] = 27'h259a53d;
    stim[33] = 27'h45629ee;
    stim[34] = 27'h522d574;
    stim[35] = 27'h05feb28;
    stim[36] = 27'h651e572;
    stim[37] = 27'h41b98d5;
    stim[38] = 27'h4d53778;
    stim[39] = 27'h39c6121;
    stim[40] = 27'h4f47dff;
    stim[41] = 27'h39e8712;
    stim[42] = 27'h1396999;
    stim[43] = 27'h4510473;
    stim[44] = 27'h255fbf7;
    stim[45] = 27'h705cdc1;
    stim[46] = 27'h48986a3;
    stim[47] = 27'h7119f41;
    stim[48] = 27'h284b1d5;
    stim[49] = 27'h205cd5c;
    stim[50] = 27'h633a345;
    stim[51] = 27'h6a3ca2b;
    stim[52] = 27'h24f88c0;
    stim[53] = 27'h0840a11;
    stim[54] = 27'h55f36d1;
    stim[55] = 27'h28ec4c7;
    stim[56] = 27'h7d29716;
    stim[57] = 27'h46cb677;
    stim[58] = 27'h01ccd2e;
    stim[59] = 27'h4604254;
    stim[60] = 27'h497377b;
    stim[61] = 27'h176e570;
    stim[62] = 27'h47a1ed1;
    stim[63] = 27'h1516d2d;
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
      expv[0] = 4'hd;
      expv[1] = 4'h6;
      expv[2] = 4'h7;
      expv[3] = 4'hc;
      expv[4] = 4'h1;
      expv[5] = 4'hb;
      expv[6] = 4'h1;
      expv[7] = 4'h0;
      expv[8] = 4'hc;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h7;
      expv[14] = 4'h0;
      expv[15] = 4'hd;
      expv[16] = 4'h6;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'hf;
      expv[20] = 4'hf;
      expv[21] = 4'h9;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'ha;
      expv[25] = 4'hc;
      expv[26] = 4'h9;
      expv[27] = 4'hb;
      expv[28] = 4'ha;
      expv[29] = 4'h2;
      expv[30] = 4'h6;
      expv[31] = 4'h2;
      expv[32] = 4'h5;
      expv[33] = 4'he;
      expv[34] = 4'h4;
      expv[35] = 4'h5;
      expv[36] = 4'h0;
      expv[37] = 4'hd;
      expv[38] = 4'h7;
      expv[39] = 4'h6;
      expv[40] = 4'hf;
      expv[41] = 4'h8;
      expv[42] = 4'h9;
      expv[43] = 4'h7;
      expv[44] = 4'hb;
      expv[45] = 4'h0;
      expv[46] = 4'ha;
      expv[47] = 4'h0;
      expv[48] = 4'h1;
      expv[49] = 4'hd;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h8;
      expv[53] = 4'h8;
      expv[54] = 4'h1;
      expv[55] = 4'h4;
      expv[56] = 4'h0;
      expv[57] = 4'h7;
      expv[58] = 4'h1;
      expv[59] = 4'h5;
      expv[60] = 4'h7;
      expv[61] = 4'h6;
      expv[62] = 4'hd;
      expv[63] = 4'h1;
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
