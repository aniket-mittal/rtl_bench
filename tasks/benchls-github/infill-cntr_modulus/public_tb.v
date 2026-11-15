// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  cntr_modulus dut (
    .clk(clk),
    .ena(in_vec[19:19]),
    .rst(in_vec[18:18]),
    .sload(in_vec[17:17]),
    .sdata(in_vec[16:1]),
    .sclear(in_vec[0:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h62e12;
    stim[1] = 20'h6fc5b;
    stim[2] = 20'h3a41a;
    stim[3] = 20'h3eb58;
    stim[4] = 20'h8d1bb;
    stim[5] = 20'h973bc;
    stim[6] = 20'h0eccd;
    stim[7] = 20'h278ca;
    stim[8] = 20'h39ab2;
    stim[9] = 20'hb441f;
    stim[10] = 20'h93386;
    stim[11] = 20'h3697c;
    stim[12] = 20'h89b64;
    stim[13] = 20'ha8783;
    stim[14] = 20'h3070a;
    stim[15] = 20'he5546;
    stim[16] = 20'hb4c9b;
    stim[17] = 20'h87638;
    stim[18] = 20'h8ef89;
    stim[19] = 20'h83683;
    stim[20] = 20'h926f0;
    stim[21] = 20'h90edc;
    stim[22] = 20'ha42b8;
    stim[23] = 20'h2bdea;
    stim[24] = 20'h221bb;
    stim[25] = 20'h39a64;
    stim[26] = 20'h1cec8;
    stim[27] = 20'h3a972;
    stim[28] = 20'h12de9;
    stim[29] = 20'h30f76;
    stim[30] = 20'h07f63;
    stim[31] = 20'h2cb83;
    stim[32] = 20'hbe8be;
    stim[33] = 20'h86216;
    stim[34] = 20'h1f2cd;
    stim[35] = 20'hb65da;
    stim[36] = 20'h07a28;
    stim[37] = 20'hab881;
    stim[38] = 20'h82b13;
    stim[39] = 20'hb3f65;
    stim[40] = 20'h8cfde;
    stim[41] = 20'h18c03;
    stim[42] = 20'hb12af;
    stim[43] = 20'h19267;
    stim[44] = 20'h14f2e;
    stim[45] = 20'h33761;
    stim[46] = 20'h9c6f4;
    stim[47] = 20'h04071;
    stim[48] = 20'h926d9;
    stim[49] = 20'h13137;
    stim[50] = 20'h29301;
    stim[51] = 20'ha0939;
    stim[52] = 20'h26611;
    stim[53] = 20'ha0bf6;
    stim[54] = 20'h8d207;
    stim[55] = 20'h00d71;
    stim[56] = 20'h30b0b;
    stim[57] = 20'h1ed6e;
    stim[58] = 20'h74231;
    stim[59] = 20'hb03c3;
    stim[60] = 20'h9f124;
    stim[61] = 20'h265e4;
    stim[62] = 20'h1f24e;
    stim[63] = 20'h1a5de;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0001;
      expv[7] = 16'h0001;
      expv[8] = 16'h0001;
      expv[9] = 16'h0001;
      expv[10] = 16'h0000;
      expv[11] = 16'h0001;
      expv[12] = 16'h0001;
      expv[13] = 16'h0002;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0001;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0001;
      expv[22] = 16'h0002;
      expv[23] = 16'h215c;
      expv[24] = 16'h215c;
      expv[25] = 16'h215c;
      expv[26] = 16'h215c;
      expv[27] = 16'h215c;
      expv[28] = 16'h215c;
      expv[29] = 16'h215c;
      expv[30] = 16'h215c;
      expv[31] = 16'h215c;
      expv[32] = 16'h215c;
      expv[33] = 16'hf45f;
      expv[34] = 16'hf460;
      expv[35] = 16'hf460;
      expv[36] = 16'hb2ed;
      expv[37] = 16'hb2ed;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0001;
      expv[42] = 16'h0001;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0001;
      expv[48] = 16'h0001;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h05fb;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0001;
      expv[62] = 16'h0001;
      expv[63] = 16'h0001;
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
