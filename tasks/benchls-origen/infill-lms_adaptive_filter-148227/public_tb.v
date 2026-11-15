// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148227 dut (
    .clk(clk),
    .x(in_vec[31:16]),
    .d(in_vec[15:0]),
    .y(out_vec[143:128]),
    .w(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h459cb68c;
    stim[1] = 32'h0910b8e2;
    stim[2] = 32'h6eae5c27;
    stim[3] = 32'h0ca0152b;
    stim[4] = 32'h4e51f0ee;
    stim[5] = 32'h15f53a6b;
    stim[6] = 32'h3af97d01;
    stim[7] = 32'h164fe33c;
    stim[8] = 32'ha65e4fb1;
    stim[9] = 32'h231a19ef;
    stim[10] = 32'hab185801;
    stim[11] = 32'hbd535e8c;
    stim[12] = 32'h4ce1f915;
    stim[13] = 32'h6eb3e8bd;
    stim[14] = 32'h16b83286;
    stim[15] = 32'h0c27d033;
    stim[16] = 32'h7c372d7d;
    stim[17] = 32'h7f275cee;
    stim[18] = 32'h4eed6fa0;
    stim[19] = 32'hc12cc4f7;
    stim[20] = 32'hdac92ef1;
    stim[21] = 32'h5f166ab0;
    stim[22] = 32'hf0d1d315;
    stim[23] = 32'he46e14c3;
    stim[24] = 32'h1b3f342b;
    stim[25] = 32'h109b9953;
    stim[26] = 32'h831310ca;
    stim[27] = 32'h7913cbe0;
    stim[28] = 32'h6678af6c;
    stim[29] = 32'hb9270b9d;
    stim[30] = 32'hf15b0fc8;
    stim[31] = 32'h26cb7ed0;
    stim[32] = 32'h170f8914;
    stim[33] = 32'hec4989e6;
    stim[34] = 32'hc680ec2f;
    stim[35] = 32'h87c750f7;
    stim[36] = 32'h90c6e2b6;
    stim[37] = 32'hbe2827e9;
    stim[38] = 32'h8be2b117;
    stim[39] = 32'h8115fab3;
    stim[40] = 32'h68c7240a;
    stim[41] = 32'h915f35c2;
    stim[42] = 32'h03b949f9;
    stim[43] = 32'h07d1a08c;
    stim[44] = 32'h92c1ed00;
    stim[45] = 32'h91735463;
    stim[46] = 32'h966041a6;
    stim[47] = 32'h26730ca1;
    stim[48] = 32'h0d5b2fde;
    stim[49] = 32'h7c8bf654;
    stim[50] = 32'h31ce4a8a;
    stim[51] = 32'h78c92992;
    stim[52] = 32'hfb637099;
    stim[53] = 32'hdd0b4ff6;
    stim[54] = 32'h25bc20b1;
    stim[55] = 32'hd58f1f62;
    stim[56] = 32'h2f86689c;
    stim[57] = 32'h17f749c6;
    stim[58] = 32'h76e0cf26;
    stim[59] = 32'h17ed4e7b;
    stim[60] = 32'hbdd03da2;
    stim[61] = 32'hbe75dee5;
    stim[62] = 32'h0a1433ec;
    stim[63] = 32'ha4a3d1bf;
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
      expv[0] = 144'hxxxx00000000000000000000000000000000;
      expv[1] = 144'hxxxx00000000000000000000000000000000;
      expv[2] = 144'hxxxx00000000000000000000000000000000;
      expv[3] = 144'hxxxx00000000000000000000000000000000;
      expv[4] = 144'hxxxx00000000000000000000000000000000;
      expv[5] = 144'hxxxx00000000000000000000000000000000;
      expv[6] = 144'hxxxx00000000000000000000000000000000;
      expv[7] = 144'hxxxx00000000000000000000000000000000;
      expv[8] = 144'hxxxx00000000000000000000000000000000;
      expv[9] = 144'hxxxx00000000000000000000000000000000;
      expv[10] = 144'hxxxx00000000000000000000000000000000;
      expv[11] = 144'hxxxx00000000000000000000000000000000;
      expv[12] = 144'hxxxx00000000000000000000000000000000;
      expv[13] = 144'hxxxx00000000000000000000000000000000;
      expv[14] = 144'hxxxx00000000000000000000000000000000;
      expv[15] = 144'hxxxx00000000000000000000000000000000;
      expv[16] = 144'hxxxx00000000000000000000000000000000;
      expv[17] = 144'hxxxx00000000000000000000000000000000;
      expv[18] = 144'hxxxx00000000000000000000000000000000;
      expv[19] = 144'hxxxx00000000000000000000000000000000;
      expv[20] = 144'hxxxx00000000000000000000000000000000;
      expv[21] = 144'hxxxx00000000000000000000000000000000;
      expv[22] = 144'hxxxx00000000000000000000000000000000;
      expv[23] = 144'hxxxx00000000000000000000000000000000;
      expv[24] = 144'hxxxx00000000000000000000000000000000;
      expv[25] = 144'hxxxx00000000000000000000000000000000;
      expv[26] = 144'hxxxx00000000000000000000000000000000;
      expv[27] = 144'hxxxx00000000000000000000000000000000;
      expv[28] = 144'hxxxx00000000000000000000000000000000;
      expv[29] = 144'hxxxx00000000000000000000000000000000;
      expv[30] = 144'hxxxx00000000000000000000000000000000;
      expv[31] = 144'hxxxx00000000000000000000000000000000;
      expv[32] = 144'hxxxx00000000000000000000000000000000;
      expv[33] = 144'hxxxx00000000000000000000000000000000;
      expv[34] = 144'hxxxx00000000000000000000000000000000;
      expv[35] = 144'hxxxx00000000000000000000000000000000;
      expv[36] = 144'hxxxx00000000000000000000000000000000;
      expv[37] = 144'hxxxx00000000000000000000000000000000;
      expv[38] = 144'hxxxx00000000000000000000000000000000;
      expv[39] = 144'hxxxx00000000000000000000000000000000;
      expv[40] = 144'hxxxx00000000000000000000000000000000;
      expv[41] = 144'hxxxx00000000000000000000000000000000;
      expv[42] = 144'hxxxx00000000000000000000000000000000;
      expv[43] = 144'hxxxx00000000000000000000000000000000;
      expv[44] = 144'hxxxx00000000000000000000000000000000;
      expv[45] = 144'hxxxx00000000000000000000000000000000;
      expv[46] = 144'hxxxx00000000000000000000000000000000;
      expv[47] = 144'hxxxx00000000000000000000000000000000;
      expv[48] = 144'hxxxx00000000000000000000000000000000;
      expv[49] = 144'hxxxx00000000000000000000000000000000;
      expv[50] = 144'hxxxx00000000000000000000000000000000;
      expv[51] = 144'hxxxx00000000000000000000000000000000;
      expv[52] = 144'hxxxx00000000000000000000000000000000;
      expv[53] = 144'hxxxx00000000000000000000000000000000;
      expv[54] = 144'hxxxx00000000000000000000000000000000;
      expv[55] = 144'hxxxx00000000000000000000000000000000;
      expv[56] = 144'hxxxx00000000000000000000000000000000;
      expv[57] = 144'hxxxx00000000000000000000000000000000;
      expv[58] = 144'hxxxx00000000000000000000000000000000;
      expv[59] = 144'hxxxx00000000000000000000000000000000;
      expv[60] = 144'hxxxx00000000000000000000000000000000;
      expv[61] = 144'hxxxx00000000000000000000000000000000;
      expv[62] = 144'hxxxx00000000000000000000000000000000;
      expv[63] = 144'hxxxx00000000000000000000000000000000;
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
