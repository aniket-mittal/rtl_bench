// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_084340 dut (
    .A(in_vec[15:10]),
    .B(in_vec[9:4]),
    .ALU_Sel(in_vec[3:0]),
    .ALU_Out(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hcd2b;
    stim[1] = 16'h7f5b;
    stim[2] = 16'h4163;
    stim[3] = 16'h7cfe;
    stim[4] = 16'ha862;
    stim[5] = 16'hfd82;
    stim[6] = 16'h1f84;
    stim[7] = 16'ha103;
    stim[8] = 16'hfdfc;
    stim[9] = 16'h0fce;
    stim[10] = 16'hedae;
    stim[11] = 16'h3987;
    stim[12] = 16'h4906;
    stim[13] = 16'h2148;
    stim[14] = 16'hf142;
    stim[15] = 16'h7d6a;
    stim[16] = 16'h745d;
    stim[17] = 16'hd06a;
    stim[18] = 16'hb30a;
    stim[19] = 16'h509e;
    stim[20] = 16'hbfed;
    stim[21] = 16'h0504;
    stim[22] = 16'h6134;
    stim[23] = 16'hcbc6;
    stim[24] = 16'h0562;
    stim[25] = 16'h3e20;
    stim[26] = 16'hc798;
    stim[27] = 16'hb2ad;
    stim[28] = 16'h2089;
    stim[29] = 16'h1d52;
    stim[30] = 16'h4c2a;
    stim[31] = 16'hb9ad;
    stim[32] = 16'hc1e6;
    stim[33] = 16'h687a;
    stim[34] = 16'h8104;
    stim[35] = 16'h6051;
    stim[36] = 16'heeb7;
    stim[37] = 16'h463f;
    stim[38] = 16'h0cca;
    stim[39] = 16'h5786;
    stim[40] = 16'h4308;
    stim[41] = 16'ha4dc;
    stim[42] = 16'h0f7c;
    stim[43] = 16'h9cd1;
    stim[44] = 16'h328c;
    stim[45] = 16'h6683;
    stim[46] = 16'hb5a0;
    stim[47] = 16'h2f1a;
    stim[48] = 16'hb9d1;
    stim[49] = 16'h949f;
    stim[50] = 16'h64fb;
    stim[51] = 16'h0762;
    stim[52] = 16'hc685;
    stim[53] = 16'h08ae;
    stim[54] = 16'hfdec;
    stim[55] = 16'h8dd1;
    stim[56] = 16'h5831;
    stim[57] = 16'ha4b3;
    stim[58] = 16'h1934;
    stim[59] = 16'h39e0;
    stim[60] = 16'he3f8;
    stim[61] = 16'h2b04;
    stim[62] = 16'ha492;
    stim[63] = 16'hf3de;
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
      expv[0] = 6'h33;
      expv[1] = 6'h1f;
      expv[2] = 6'h2f;
      expv[3] = 6'h1f;
      expv[4] = 6'h2c;
      expv[5] = 6'h27;
      expv[6] = 6'h0e;
      expv[7] = 6'h17;
      expv[8] = 6'h3f;
      expv[9] = 6'h03;
      expv[10] = 6'h3b;
      expv[11] = 6'h07;
      expv[12] = 6'h24;
      expv[13] = 6'h10;
      expv[14] = 6'h28;
      expv[15] = 6'h1f;
      expv[16] = 6'h1d;
      expv[17] = 6'h34;
      expv[18] = 6'h2c;
      expv[19] = 6'h14;
      expv[20] = 6'h2f;
      expv[21] = 6'h02;
      expv[22] = 6'h30;
      expv[23] = 6'h25;
      expv[24] = 6'h17;
      expv[25] = 6'h02;
      expv[26] = 6'h22;
      expv[27] = 6'h2c;
      expv[28] = 6'h04;
      expv[29] = 6'h12;
      expv[30] = 6'h13;
      expv[31] = 6'h2e;
      expv[32] = 6'h21;
      expv[33] = 6'h1a;
      expv[34] = 6'h00;
      expv[35] = 6'h1d;
      expv[36] = 6'h3d;
      expv[37] = 6'h11;
      expv[38] = 6'h03;
      expv[39] = 6'h2a;
      expv[40] = 6'h20;
      expv[41] = 6'h29;
      expv[42] = 6'h03;
      expv[43] = 6'h2f;
      expv[44] = 6'h0c;
      expv[45] = 6'h26;
      expv[46] = 6'h08;
      expv[47] = 6'h0b;
      expv[48] = 6'h3f;
      expv[49] = 6'h25;
      expv[50] = 6'h19;
      expv[51] = 6'h37;
      expv[52] = 6'h18;
      expv[53] = 6'h02;
      expv[54] = 6'h3f;
      expv[55] = 6'h3f;
      expv[56] = 6'h17;
      expv[57] = 6'h16;
      expv[58] = 6'h0c;
      expv[59] = 6'h0e;
      expv[60] = 6'h30;
      expv[61] = 6'h14;
      expv[62] = 6'h20;
      expv[63] = 6'h3c;
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
