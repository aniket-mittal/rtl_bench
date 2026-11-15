// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_018549 dut (
    .clk(clk),
    .bt656_in(in_vec[7:0]),
    .yc_data_out(out_vec[20:5]),
    .vs(out_vec[4:4]),
    .hs(out_vec[3:3]),
    .field(out_vec[2:2]),
    .de(out_vec[1:1]),
    .is_pal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc4;
    stim[1] = 8'hf0;
    stim[2] = 8'h4e;
    stim[3] = 8'h60;
    stim[4] = 8'hc1;
    stim[5] = 8'hcb;
    stim[6] = 8'hc6;
    stim[7] = 8'h26;
    stim[8] = 8'h68;
    stim[9] = 8'h15;
    stim[10] = 8'h80;
    stim[11] = 8'h95;
    stim[12] = 8'h10;
    stim[13] = 8'h04;
    stim[14] = 8'h6c;
    stim[15] = 8'h68;
    stim[16] = 8'h5e;
    stim[17] = 8'h0e;
    stim[18] = 8'hc0;
    stim[19] = 8'hbb;
    stim[20] = 8'h68;
    stim[21] = 8'ha2;
    stim[22] = 8'h14;
    stim[23] = 8'h0a;
    stim[24] = 8'ha0;
    stim[25] = 8'h00;
    stim[26] = 8'h1a;
    stim[27] = 8'hd8;
    stim[28] = 8'h64;
    stim[29] = 8'h39;
    stim[30] = 8'h60;
    stim[31] = 8'hc5;
    stim[32] = 8'h6c;
    stim[33] = 8'h31;
    stim[34] = 8'hde;
    stim[35] = 8'hd0;
    stim[36] = 8'ha5;
    stim[37] = 8'h95;
    stim[38] = 8'he1;
    stim[39] = 8'h96;
    stim[40] = 8'h48;
    stim[41] = 8'h04;
    stim[42] = 8'hb4;
    stim[43] = 8'h24;
    stim[44] = 8'h22;
    stim[45] = 8'h7e;
    stim[46] = 8'h2f;
    stim[47] = 8'hf8;
    stim[48] = 8'h47;
    stim[49] = 8'hee;
    stim[50] = 8'hc3;
    stim[51] = 8'hc5;
    stim[52] = 8'h42;
    stim[53] = 8'h34;
    stim[54] = 8'hbf;
    stim[55] = 8'h82;
    stim[56] = 8'had;
    stim[57] = 8'hce;
    stim[58] = 8'h3b;
    stim[59] = 8'h07;
    stim[60] = 8'hb7;
    stim[61] = 8'h99;
    stim[62] = 8'hcc;
    stim[63] = 8'h6a;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'hxxx8xx;
      expv[2] = 21'h189exx;
      expv[3] = 21'h1e09xx;
      expv[4] = 21'h09ccxx;
      expv[5] = 21'h0c18xx;
      expv[6] = 21'h1839xx;
      expv[7] = 21'h1978xx;
      expv[8] = 21'h18c4xx;
      expv[9] = 21'h04cdxx;
      expv[10] = 21'h0d02xx;
      expv[11] = 21'h02b0xx;
      expv[12] = 21'h1012xx;
      expv[13] = 21'h12a2xx;
      expv[14] = 21'h0200xx;
      expv[15] = 21'h008dxx;
      expv[16] = 21'h0d8dxx;
      expv[17] = 21'h0d0bxx;
      expv[18] = 21'h0bc1xx;
      expv[19] = 21'h01d8xx;
      expv[20] = 21'h1817xx;
      expv[21] = 21'h176dxx;
      expv[22] = 21'h0d14xx;
      expv[23] = 21'h1442xx;
      expv[24] = 21'h0281xx;
      expv[25] = 21'h0154xx;
      expv[26] = 21'h1400xx;
      expv[27] = 21'h0003xx;
      expv[28] = 21'h035bxx;
      expv[29] = 21'h1b0cxx;
      expv[30] = 21'h0c87xx;
      expv[31] = 21'h072cxx;
      expv[32] = 21'h0c18xx;
      expv[33] = 21'h18adxx;
      expv[34] = 21'h0d86xx;
      expv[35] = 21'h063bxx;
      expv[36] = 21'h1bdaxx;
      expv[37] = 21'h1a14xx;
      expv[38] = 21'h14b2xx;
      expv[39] = 21'h12bcxx;
      expv[40] = 21'h1c32xx;
      expv[41] = 21'h12c9xx;
      expv[42] = 21'h0900xx;
      expv[43] = 21'h0096xx;
      expv[44] = 21'h1684xx;
      expv[45] = 21'h0484xx;
      expv[46] = 21'h044fxx;
      expv[47] = 21'h0fc5xx;
      expv[48] = 21'h05ffxx;
      expv[49] = 21'h1f08xx;
      expv[50] = 21'h08fdxx;
      expv[51] = 21'h1dd8xx;
      expv[52] = 21'h1878xx;
      expv[53] = 21'h18a8xx;
      expv[54] = 21'h0846xx;
      expv[55] = 21'h0697xx;
      expv[56] = 21'h17f0xx;
      expv[57] = 21'h1055xx;
      expv[58] = 21'h15b9xx;
      expv[59] = 21'h19c7xx;
      expv[60] = 21'h0760xx;
      expv[61] = 21'h00f6xx;
      expv[62] = 21'h16f3xx;
      expv[63] = 21'h1339xx;
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
